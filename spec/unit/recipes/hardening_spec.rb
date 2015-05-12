# encoding: utf-8

require 'spec_helper'

describe 'mysql-hardening::hardening' do

  let(:chef_run) do
    ChefSpec::ServerRunner.converge('mysql::server', 'mysql-hardening::hardening')
  end

  it 'should create a my.cnf file and protect it' do

    expect(chef_run).to create_file(chef_run.node['mysql-hardening']['mysql-conf']).
      with(
        mode:  '600',
        owner: 'root',
        group: 'root'
      )

  end

  it 'should create a hardening.cnf with the hardening configuration from a template' do

    expect(chef_run).to create_template(chef_run.node['mysql-hardening']['hardening-conf']).
      with(
        owner: chef_run.node['mysql-hardening']['user'],
        mode:  '750'
      )

  end

  it 'should create the data directory and ensure permission' do

    expect(chef_run).to create_directory(chef_run.node['mysql']['data_dir']).
      with(
        owner: chef_run.node['mysql-hardening']['user'],
        mode:  '755'
      )

  end

end
