#!/bin/bash
kubectl describe secret dashboard | grep token: | cut -f 2 -d : | tr -d ' ' | pbcopy
