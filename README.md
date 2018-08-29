# mumonit
A single dashboard for monit across multiple instances

## What is issue with current Monit?

Monit doesn't support dashboard across instances. This is exactly what we are going to solve in this repository.

## What are we making?

- We are writing an **Rails application(mumonit)** which connects to all the monit processes across instances through **https**. 
- We can have various dashboards based on the information we have from monit processes
- [OPTIONAL] We store the information from monit and build beautiful dashboards.

## What are my alternatives if not this?
- [MMonit](https://mmonit.com/)
