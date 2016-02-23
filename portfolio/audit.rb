#!/usr/bin/env ruby

PWD=`pwd`
exec "echo \"Auditing #{PWD}\""
puts $?

puts `ls -R`

exec "echo \'# files submitted\' >> audit.txt"
exec "find . -type f ! -size 0 | wc -l >> audit.txt"
exec "echo \'Scripts (target 42):\' >> audit.txt"
exec "find . -type f -name \'*.m\' ! -size 0 | wc -l >> audit.txt"
exec "echo \'Simulink models (target 7):\' >> audit.txt"
exec "find . -type f -name \'*.slx'\ ! -size 0 | wc -l >> audit.txt"

exec "echo \'Diffs in diffs.txt\' >> audit.txt"
exec "diff ../model_audit.txt audit.txt > diffs.txt"
