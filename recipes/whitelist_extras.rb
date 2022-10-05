# frozen_string_literal: true

#
# Author:: Nathan James <nathan.james@yakara.com>
# Cookbook:: privoxyak
# Recipe:: whitelist_extras
#
# Copyright:: (C) 2022 Yakara Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'csv'

basename = 'extras'

rf = remote_file "#{Chef::Config[:file_cache_path]}/centos-#{basename}" do
  source "http://mirrorlist.centos.org/?arch=x86_64&repo=#{basename}&release=7"
  sensitive true
end

ruby_block 'whitelist_extras' do
  block do
    data = File.read(rf.path, mode: 'r:iso-8859-1')
    data.gsub!(/(?<!\\)\\"/, '""')

    patterns = []

    data.each_line do |line|
      patterns.append(Chef::Privoxyak::Helpers.action_pattern(line.chomp))
    end

    node.default['privoxyak']['whitelist']['CentOS-extras'] =
      Chef::Privoxyak::Helpers.normalize_patterns(patterns)
  end
end

node.default['privoxyak']['whitelist']['Mirror Lists'] <<
  '.centos.org'
