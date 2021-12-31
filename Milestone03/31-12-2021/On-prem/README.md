# Deployment of Arktos without Mizar CNI (Community repo)

Deployment Infra | Deployments Counts | Success | Failures | Comments
--- | --- | --- | --- | ---
AWS | 1 | 1 | 0 |-Health criteria have succeeded and pods did ping each other.
GCE | 1 | 1 | 0 |-Health criteria have succeeded and pods did ping each other.
On-prem | 1 | 0 | 1 |-Node was not getting ready and pods were stuck in containercrearing state.
