%w(bin/cassandra-reaper
   bin/spreaper
   conf/cassandra-reaper.yaml).each do |path|
  describe file("/opt/cassandra-reaper/default/#{path}") do
    it { should exist }
    it { should be_readable }
  end
end

describe command('sudo systemctl status cassandra-reaper') do
  its('stdout') { should match 'active \(running\)' }
  its('stdout') { should match 'enabled;' }
  its('stdout') { should_not match 'ERROR' }
  its('stdout') { should_not match 'WARN' }
end
