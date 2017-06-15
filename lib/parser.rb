require __dir__ + '/uniparser.rb'

def doParse
	if File.exist?("/etc/atceph/config")
		parser = UniParser.new("/etc/atceph/config")
	else
		parser = UniParser.new( __dir__ + "/../config" )
	end

	parser.parse_all()
	parser.parse_cli( ["-h", "--help"], "Show this help", false)
	parser.parse_cli( ["-c", "--config"], "Use this ceph configuration file instead of the default", true, [:ceph, :config])
	parser.parse_cli( ["-n", "--name"], "Client name for authentication", true, [:ceph, :client])
	parser.parse_cli( ["-f", "--format"], "Change output format")

	ceph_prefix = "#{parser.config[:ceph][:cmd_prefix]} #{parser.config[:ceph][:bin_dir]}/"

	ceph_args = ""
	# FIXME: switch to dig() later
	ceph_args = "#{ceph_args} -c #{parser.merged[:ceph][:config]}" if parser.merged.has_key?(:ceph) && parser.merged[:ceph].has_key?(:config)
	ceph_args = "#{ceph_args} --name #{parser.merged[:ceph][:client]}" if parser.merged.has_key?(:ceph) && parser.merged[:ceph].has_key?(:client)

	return parser, ceph_prefix, ceph_args
end
