# Ruby script to telnet to SMTP server and send a bunch of email.

require 'net/telnet'

ip = SERVERIP
port = 25
domain = TARGETDOMAIN
user_base = "User"
number_of_users = 500

source_domain = SOURCEDOMAIN
source_user_base = "User"

emails_to_send = 10000

dictionary = File.open('/usr/share/dict/words', 'r') { |file| file.readlines }
dictionary_size = dictionary.size

tn = Net::Telnet::new("Host" => ip, "Port" => port, "Timeout" => 30,
"Output_log" => "output_log.log", # "Dump_log" => "dump_log.log",
"Prompt" => /.*/, "Telnetmode" => false)
tn.waitfor(/ESMTP/)
tn.puts("EHLO #{source_domain}")
tn.waitfor(/250/)

emails_to_send.times do
  user_id = rand(number_of_users)+1
  source_user_id = rand(number_of_users)+1
  source_user = source_user_base.to_s + source_user_id.to_s + "@" + source_domain.to_s
  user = "user1to500@" + domain.to_s
  email_lines = (-1*Math.log(1.0-rand(1000000)/1000000.0)*1000+1).truncate+5000
  email_words_per_line = (-1*Math.log(1.0-rand(1000000)/1000000.0)*10+1).truncate

  tn.puts("MAIL FROM: #{source_user}")
  tn.puts("RCPT TO: #{user}")
  tn.puts("DATA")
  tn.puts("Date: 12 Dec 2011 12:12:12 -1200")
  tn.puts("From: #{source_user} <#{source_user}>")
  tn.puts("To: #{user} <#{user}>")
  tn.puts("Subject: Lines: #{email_lines} Words: #{email_words_per_line}")
  tn.puts("")
#  email_lines.times do # speed trials
    current_line = []
    email_words_per_line.times do
      current_line << dictionary[rand(dictionary_size)].chomp
    end
  email_lines.times do
    tn.puts(current_line.join(" "))
    #sleep(0.001)
  end
  tn.puts(".")
end
tn.puts('QUIT')
tn.close()
