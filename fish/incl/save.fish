function save 
  echo "alias $argv '$history[2]'" >> ~/dotfiles/fish/incl/save.fish
  . ~/dotfiles/fish/incl/save.fish
end

alias reload '. ~/.config/fish/config.fish '
alias gcm 'gc master'
alias gca 'git commit --amend'
alias gotodevvfe 'ssh jim@ec2-54-85-216-41.compute-1.amazonaws.com'
alias gotojenkins 'ssh -i ~/.ssh/jellojenkins.pem ubuntu@jenkins.jellolabs.com'
alias psbe './tools/psql_remote_db.sh service 4real-sfe'
alias pse './tools/read_only_db.sh echub'
alias psb './tools/read_only_db.sh branded'
alias psee './tools/psql_remote_db.sh service 4real-echub'
alias gfrm 'gf; grm'
alias gdc 'gd --cached'
