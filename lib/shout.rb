require 'syslog'

def shout(text, prior = "INFO", component = "main")
        prior = Syslog::LOG_INFO        if prior == "INFO"
        prior = Syslog::LOG_ERR         if prior == "ERR"

        syslog = Syslog.open(File.basename($0), Syslog::LOG_PID, Syslog::LOG_DAEMON)
        syslog.log(prior, "#{component} => #{text}")
        syslog.close

        date = Time.now().strftime("%Y-%m-%d %H:%M:%S")
        puts "[#{date}]: #{component} => #{text}"
end

