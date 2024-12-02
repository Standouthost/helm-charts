## How To Upgrade Chart

Currently, there is no official chart. See https://github.com/kubevirt/community/pull/224

So, this chart was created using yamlSplit and following

https://kubevirt.io//quickstart_minikube/
https://kubevirt.io/labs/kubernetes/lab2

And splitting those 4 files into all of these.

To upgrade, remove all files in templates and replace with desired version

## 2 charts really

We could split this into two charts, one for kubevirt, and one for CDI
