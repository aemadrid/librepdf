#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'ant'

root = File.dirname(__FILE__)

classpath = [
  root + '/java/lib/snakeyaml-1.14.jar',
  root + '/java/lib/juh-3.2.1.jar',
  root + '/java/lib/jurt-3.2.1.jar',
  root + '/java/lib/ridl-3.2.1.jar',
  root + '/java/lib/unoil-3.2.1.jar',
  ENV['JRUBYJAR'],
].compact.join(':')

desc "Build librepdf jar (required ant)"
task :jar do
  ant.mkdir dir: root + '/java/bin'
  ant.javac srcdir: root + '/java/src', destdir: root + '/java/bin', includeantruntime: 'no', classpath: classpath do
    compilerarg value: '-Xlint:unchecked'
  end
  ant.jar jarfile: root + '/lib/librepdf/java/librepdf.jar', filesetmanifest: 'mergewithoutmain' do
    fileset dir: root + '/java/bin', includes: '**/*.class'
    fileset dir: root + '/java/src', includes: '**/*.java'
  end
  ant.copy todir: root + '/lib/librepdf/java/' do
    fileset dir: root + '/java/lib', includes: '*.jar'
  end
  ant.delete dir: root + '/java/bin'
end

begin
  gem 'rspec', '>= 2.0.0'
  require 'rspec'
  require 'rspec/core/rake_task'
rescue LoadError
  puts <<EOS
To use rspec for testing you must install rspec gem:
    gem install rspec

EOS
  exit 0
end

desc "Run the specs under spec/*"
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
  t.rspec_opts = '-c -f d'
end

task build: :jar
task spec: :jar
task default: :spec

