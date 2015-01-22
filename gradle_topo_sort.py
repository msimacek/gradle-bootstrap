#!/usr/bin/python
#
# Print list of Gradle modules sorted by dependencies.  First module
# printed doesn't depend on any other module.  All subsequent modules
# can depend only on modules already printed.  This is the order in
# which modules should be compiled.
#
# Author: Mikolaj Izdebski <mizdebsk@redhat.com>

import sys
from glob import glob
from zipfile import ZipFile


class GradleModule(object):
    def __init__(self, path):
        self.name = path[path.rindex("/") + 1 : path.rindex("-")]
        self.path = path
        self.dependencies = []

    def read_dependencies(self):
        with ZipFile(self.path) as jar:
            props_name = self.name + "-classpath.properties"
            with jar.open(props_name, "rU") as props:
                for line in [line.rstrip() for line in props.readlines()]:
                    if line.startswith("projects=") and line[9:]:
                        self.dependencies = line[9:].split(",")

    def __eq__(self, other):
        return self.name == other.name

    def __hash__(self):
        return hash(self.name)


# Read all Gradle modules from given Gradle home directory
def read_gradle_modules(gradle_home):
    paths = []
    for pattern in ["/lib/gradle-*.jar", "/lib/plugins/gradle-*.jar"]:
        paths.extend(glob(gradle_home + pattern))

    return [GradleModule(path) for path in paths]


# Resolve module dependencies to concrete modules
def resolve_dependencies(modules):
    mapping = dict((module.name, module) for module in modules)

    for module in modules:
        module.read_dependencies()
        resolved_deps = []
        for dep in module.dependencies:
            resolved_dep = mapping.get(dep, None)
            if not resolved_dep:
                raise RuntimeError("Unresolved dependency from %s to %s" % (module.name, dep))
            resolved_deps.append(resolved_dep)
        module.dependencies = resolved_deps


# Sort modules in-situ, placing them in dependency order
def topological_sort(modules):
    not_visited = set(modules)
    visiting = set()
    del modules[:]

    def visit(module):
        visiting.add(module)
        for dependency in module.dependencies:
            if dependency in visiting:
                raise RuntimeError("module dependency cycle detected")
            if dependency in not_visited:
                visit(dependency)
        modules.append(module)
        not_visited.remove(module)
        visiting.remove(module)

    while not_visited:
        visit(next(iter(not_visited)))

    return modules

if len(sys.argv) != 2:
    sys.exit("Missing argument, usage: %s <path-to-unpacked-gradle-binary-distribution>" % sys.argv[0])
gradle_home = sys.argv[1]

modules = read_gradle_modules(gradle_home)
if not modules:
    sys.exit("Unable to find any Gradle modules in specifed location")

resolve_dependencies(modules)

topological_sort(modules)

for module in modules:
    print module.name
