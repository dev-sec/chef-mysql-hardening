# encoding: utf-8

require 'spec_helper'

describe 'mysql-hardening::default' do

  let(:chef_run) do
    ChefSpec::ServerRunner.converge('mysql::server', 'mysql-hardening::hardening')
  end

  it 'includes mysql-hardening::hardening recipe' do
    expect(chef_run).to include_recipe('mysql-hardening::hardening')
  end

end
