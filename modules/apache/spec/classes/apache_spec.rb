require 'spec_helper'
describe('apache', :type => :class) do
    let(:node) { 'troll.puppetlabs.vm' } ## web001

    describe 'when applied to redhat with nothing special' do
        let (:facts) { {
            :osfamily   => 'Redhat',
            :ipaddress  => '127.0.0.1'
        } }

        it {
            should contain_package('apache').with({
                'ensure'    => 'present',
                'name'      => 'httpd',
            })

            should contain_file('apache_config').with({
                'ensure'    => 'file',
                'source'    => "puppet:///modules/apache/#{facts[:osfamily]}.conf",
            })

            should contain_service('apache').with({
                'ensure'    => 'running',
                'enable'    => 'true',
                'name'      => 'httpd',
            })
        }
    end
end