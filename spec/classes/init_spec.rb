require 'spec_helper'
describe 'zabbix_agent' do

  context 'with defaults for all parameters' do
    it { should contain_class('zabbix_agent') }
  end
end
