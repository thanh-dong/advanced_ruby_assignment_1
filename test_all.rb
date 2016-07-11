# encoding: utf-8
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::HtmlReporter.new]

require_relative 'unit_1/u1_class_hierarchy'
require_relative 'unit_1/u1_class_vs_instance'
require_relative 'unit_1/u1_include_vs_exclude'
require_relative 'unit_1/u1_lambda_vs_proc'
