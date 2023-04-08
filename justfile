set positional-arguments

fmt:
  prettier --write .

serve:
  zola serve

deploy:
  ssh 8el 'mkdir -p infrastructure/website'
  rsync -avz $(git ls-files) 8el:~/infrastructure/website
  ssh 8el 'cd ~/infrastructure/website && zola build && docker restart caddy'
