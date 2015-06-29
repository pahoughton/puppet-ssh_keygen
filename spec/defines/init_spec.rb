require 'spec_helper'

$osfam_home_base = {
  :Darwin => '/Users',
  :RedHat => '/home',
  :Debian => '/home',
}
describe 'ssh_keygen' do

  $osfam_home_base.each {|osfam,pkg|
    context "on osfamily #{osfam}" do
      let(:facts) {{
        :osfamily                 => "#{osfam}",
      }}

      context 'with title tester' do
        let(:title) {'tester'}

        it "ensure .ssh directory" do
          should contain_file("#{base}/tester/.ssh/").with(
            'owner' => 'tester',
            'mode'  => '0700'
          )
        end
        it "generates #{base}/tester/.ssh/id_rsa" do
          should contain_exec('ssh_keygen-tester').
            with_creates("#{base}/tester/.ssh/id_rsa")
          
  context 'on RedHat' do
    let(:facts) {{
      :osfamily                 => 'RedHat',
      :operatingsystem          => 'Fedora',
      :operatingsystemrelease   => '19',
      :concat_basedir           => '/var/lib/puppet/concat',
      :postgres_default_version => '9.2'
    }}
    
  let(:title) { 'john' }

  context 'passing home parameter' do
    let(:params) { {:home => '/h/j'} }

    it { should 
  end

  context 'not passing home' do
    let(:params) { {} }

    it { should contain_exec('ssh_keygen-john').with_creates('/home/john/.ssh/id_rsa') }
  end

end
