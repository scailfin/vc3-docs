#! /bin/bash

# Note: TCP ports 8443 10250 need to be open
#-A INPUT -p tcp -m tcp --dport 9618 -j ACCEPT
#-A INPUT -p tcp -m tcp --dport 8443 -j ACCEPT
#-A INPUT -p tcp -m tcp --dport 10250 -j ACCEPT

# Run as root
condor_dockername='vc3condor'
cid=$(docker inspect $condor_dockername --format='{{.Id}}')
condor_address=$(docker exec -it $cid condor_status -schedd -af MyAddress)


# Create virtualenv
python3.6 -m venv /usr/local/reana
source /usr/local/reana/bin/activate

# Install REANA
pip install --upgrade pip
pip3.6 install git+https://github.com/khurtado/reana-cluster@vc3v2p2
pip3.6 install git+https://github.com/khurtado/reana-client@vc3v2p2

# Get cluster conofiguration
curl -Lo /usr/local/reana/reana-cluster-vc3.yaml https://raw.githubusercontent.com/khurtado/reana-cluster/vc3v2p2/reana_cluster/configurations/reana-cluster-vc3.yaml
chmod 644 /usr/local/reana/reana-cluster-vc3.yaml

# Now edit file @TODO
source /etc/profile.d/kubernetes.sh
#source /usr/local/reana/bin/activate
reana-cluster -f /usr/local/reana/reana-cluster-vc3.yaml init --skip-create-traefik

# Adter a while
wait_reana(){
  local max_retries=20
  count=0
  until [ $count -ge $max_retries ]
  do
      if reana-cluster status > /dev/null 2>&1; then
          break
      fi
      ((count++))
      sleep 15
  done
  if [ $count -ge $max_retries ]; then
      echo "Reana did not succeed"
      return 1
  else
      sleep 2
      reana-cluster env --include-admin-token > /etc/profile.d/reana.sh
      return 0
  fi
}
wait_reana
