runbook:
  '*':
    - certs
  '*rethinkdb*':
    - appusers.rethinkdb
    - appgroups.rethinkdb
    - certs.rethink
    - rethinkdb
  '*redis*':
    - certs.redis
    - redis
  '*web*':
    - runbook
  '*bridge*':
    - runbook
    - runbook.bridge
    - certs.bridge
  '*control*':
    - runbook
    - runbook.monitors.control
    - certs.monitors.control
  '*monitorbroker*':
    - runbook
    - runbook.monitors.broker
    - certs.monitors.broker
  '*worker*':
    - runbook
    - certs.monitors.worker
  '*actioner*':
    - runbook
    - runbook.actions.actioner
    - certs.actions.actioner
  '*actionbroker*':
    - runbook
    - runbook.actions.broker
    - certs.actions.broker

