# do not run as administrator

# Optional: Needed to run a remote script the first time
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser 
irm get.scoop.sh | iex

scoop bucket add main
scoop install git
scoop install neofetch

# scoop update