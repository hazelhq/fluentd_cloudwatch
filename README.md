docker run -d \
  -e "LOGGLY_TOKEN={TOKEN}" \
  --name paysavvy_loggly \
  paysavvy/fluentd_loggly

https://github.com/ryotarai/fluent-plugin-cloudwatch-logs