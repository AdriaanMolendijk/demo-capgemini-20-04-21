oc new-project compliance-operator
oc apply -f . -n compliance-operator

# get rules
oc get rules.compliance

# examples
# rhcos4-no-direct-root-logins
# rhcos4-no-empty-passwords

# get profiles
oc get profiles.compliance

# get compliancescan
oc get compliancescan

# get results
oc get compliancecheckresult