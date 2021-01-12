# A Spike to Learn the Application Load Balancer (ALB) in AWS via Terraform

We are gonna try and create an ALB for HTTP and HTTPS traffic.
This traffic will be sent to two EC2 instances with a simple web server.

```
                       +----------+     +--------------+              
                       |          |     |              |
                  +--->| Listener |---->| Target Group |
                  |    |          |     |              |      
+-------------+   |    +----------+     +--------------+
| Application |   |        HTTP 
|    Load     |---+
|  Balancer   |   | 
+-------------+   |    +----------+     +--------------+
                  |    |          |     |              |
                  +--->| Listener |---->| Target Group |
                       |          |     |              |
                       +----------+     +--------------+
                           HTTPS                      
```                   

Steps:

1 - Create Load Balancer
2 - Create Target Groups
3 - Create Listeners and bind them to  



Traffic enters the Application Load Balancer where Listener(s) listen for traffic of a certain kind and then direct that traffic based upon certain rules to Target Group(s).
The Rules tie the Listener to Target Groups and these rules can contain Conditions.

For the HTTPS Listener we will create an SSL Certificate.
We will create a couple of EC2 instances with a basic web server.
We will create Target Groups and have them 'target' our web servers.



We might have a play with path-based routing.