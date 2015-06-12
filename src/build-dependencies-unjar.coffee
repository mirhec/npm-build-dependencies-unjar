fs = require 'fs'
path = require 'path'
AdmZip = require 'adm-zip'
colors = require 'colors'
env = process.env

module.exports = buildDepsUnjar = () ->
    deppath = env.npm_package_config_dependencies_dest ? 'lib'
    bin = env.npm_package_config_bin ? 'bin'
    deps = fs.readdirSync deppath
    for name in deps
        zip = AdmZip path.join deppath, name
        zip.extractAllTo path.join bin, 'classes'
        console.log 'build:dependencies-unjar :: Unzip ' + name + ' ... ' + 'Ok.'.green
