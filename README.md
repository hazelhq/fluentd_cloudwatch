docker run -d \
  -e "LOGGLY_TOKEN={TOKEN}" \
  --name paysavvy_loggly \
  paysavvy/fluentd_loggly

