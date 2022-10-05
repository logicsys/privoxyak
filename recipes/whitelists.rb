# frozen_string_literal: true

#
# Author:: James Le Cuirot <james.le-cuirot@yakara.com>
# Cookbook:: privoxyak
# Recipe:: whitelists
#
# Copyright:: (C) 2017 Yakara Ltd
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

include_recipe 'privoxyak::whitelist_centos'
include_recipe 'privoxyak::whitelist_cpan'
include_recipe 'privoxyak::whitelist_elrepo'
include_recipe 'privoxyak::whitelist_epel'
include_recipe 'privoxyak::whitelist_extras'
