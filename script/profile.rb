require 'memory_profiler'
require 'stackprof'
require 'benchmark'

require_relative 'profile/generate_pdf'

def profile(caption, mode:)
  if ARGV.empty? || ARGV.include?(mode)
    puts '=' * 20
    puts caption
    puts '=' * 20
    puts ''
    yield
    puts ''
  end
end

profile 'Benchmark', mode: 'benchmark' do
  realtimes = 5.times.map {
    Benchmark.realtime { generate_pdf }
  }
  puts "Avg = #{realtimes.sum / 5.0}"
  puts "Max = #{realtimes.max}"
  puts "Min = #{realtimes.min}"
end

profile 'CPU Time', mode: 'cpu-time' do
  StackProf.run(mode: :cpu, interval: 1000, out: 'stackprof-profile-cpu.dump') { generate_pdf }
  system('bundle exec stackprof stackprof-profile-cpu.dump --text --limit 100')
end

profile 'Object Allocation', mode: 'object-allocation' do
  StackProf.run(mode: :object, interval: 1000, out: 'stackprof-profile-object.dump') { generate_pdf }
  system('bundle exec stackprof stackprof-profile-object.dump --text --limit 100')
end

profile 'Object Memory Size', mode: 'object-size' do
  report = MemoryProfiler.report { generate_pdf }
  report.pretty_print
end
