# Secrets Example Structure
# Create a private git repo with this structure and point flake.nix to it.

mkdir -p secrets-example/{client-info,hosts,keys/sops/age,passwords/{immich,nextcloud,users},services/{photoprism,taskwarrior},users}

# Dummy files
echo "myusername" > secrets-example/users/main
echo "192.168.1.100" > secrets-example/hosts/laptop
echo "192.168.1.101" > secrets-example/hosts/rpi5
echo "hashed_password_here" > secrets-example/passwords/users/main-user
echo "AGE-SECRET-KEY-1..." > secrets-example/keys/sops/age/keys.txt
