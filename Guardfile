guard :rspec, cmd: "bundle exec rspec" do

  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^lib/(.*)\.rb|) do |file|
    system "bundle exec ruby spec/#{file[1]}_spec.rb -v"
  end

end
