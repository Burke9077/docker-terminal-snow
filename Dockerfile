FROM ubuntu:18.04

# Install ruby
RUN apt-get update && \
  apt-get -qqy install ruby && \
  rm -rf /var/lib/apt/lists/*
  
# Run our snow command when the user launches the container
# Taken from https://www.youtube.com/watch?v=mvvYlyYjuBw
# All credit goes to the creator above, this is just a simple way to deploy this app.
CMD ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'
