# # encoding: utf-8

# Inspec test for recipe my_iis::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe windows_feature('Web-Server') do
  it { should be_installed }
end

# Ensure IIS Service is running
describe service('W3SVC') do
  it { should be_installed }
  it { should be_running }
end

# Ensure the WebServer is running on port 80
describe port(80) do
  it { should be_listening }
end

describe file ('c:\inetpub\wwwroot\Default.html') do
  it { should exist }
  it { should be_file }
  its('content') { should match(/Hello world! Authored by Jane Doe/) }
end

describe file('C:\temp\my_iis.tgz') do
  it { should exist }
  it { should be_file }
end

  
