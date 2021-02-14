#!/bin/sh
if [ $1 = "exec" ];
	then
		kubectl exec -it $(echo $(kubectl get pods | grep $(echo $2) | cut -f 1 -d ' ')) -- sh
fi
if [ $1 = "logs"  ];
	then
		kubectl logs $(echo $(kubectl get pods | grep $(echo $2) | cut -f 1 -d ' '))
fi
if [ $1 = "delete"  ];
	then
		kubectl delete pod $(echo $(kubectl get pods | grep $(echo $2) | cut -f 1 -d ' '))
fi
