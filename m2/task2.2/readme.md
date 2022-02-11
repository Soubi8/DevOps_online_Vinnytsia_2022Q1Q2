## Module 2 Virtualization and Cloud Basic
### AWS Familiarization
1. I browsed through the AWS User Guide and familiarized myself with the available information related to limitations of the used account
type as well as about the cost and billing.
2. The first thing that has to be done - registration on the AWS website. I created an AWS Free Tier account to try some services free of charge.
3. *** Trying hands-on tutorials. Completed ***
4. Next step was to find out information about EC2 instances. I logged into my AWS account, as a region I chose the Frankfurt eu-central-1. 
Then I went through the ==Launch Instance== process. I chose the "Red Hat Enterprise Linux 8 (HVM), SSD Volume Type - ami-06ec8443c2a35b0ba (64-bit x86)" 
as an Amazon Machine Image and "t2.micro" Instance Type. I was offered to setup the instance details, add storage and tags, configure the 
security groups and review the instance creation.
where I read about each option and decided to go with the defaults for now. 
I saved the pair of private keys, which were used to connect to the instance afterwards. 

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/1.jpg)

5. Next task was to create a snapshot of the instance. I went to ==Elastic Block Store== -> ==Snapshots== -> ==Create snapshot== to achieve this.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/2.jpg)

6. To complete the next step, I went into ==Volumes==, I created the volume named __Disk_D__ there and attached it
to my running instance. 
__Note:__ Important! The volume has to be created in the same availability zone, where the instance is, in order to be attached to it.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/3.jpg)
![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/4.jpg)

Then I connected through SSH to the instance and ran the following commands to attach the __Disk_D__, steps are shown on the below screenshot

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/5.jpg)

To unmount the disk, I ran sudo `umount /dev/xvdb`

7. To complete the next task, first I created the image from the snapshot.

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/6.jpg)

Then in ==Images== -> ==AMIs== I launched the instance from the previously created image.

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/7.jpg)
![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/8.jpg)

8. As the next step I detached the volume __Disk_D__ from the first instance and attached it to the second. 

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/9.jpg)

I connected to the second instance and mounted the __Disk_D__. As you can see from the below screenshot, the file.txt created previously 
is present. 

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/10.jpg)

9. Reviewed the ==Register a Domain Name with Amazon Route 53== guide.
10. Followed the ==Launch and configure a WordPress instance with Amazon Lightsail== guide and launched my own WordPress instance.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/11.jpg)

11. Reviewed the ==Store and Retrieve a File with Amazon S3== tutorial and re-created the steps in my own S3 bucket.

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/12.jpg)

12. Familiarized myself with the ==Batch upload files to the cloud to Amazon S3 using the AWS CLI== guide and executed the same steps.

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/13.jpg)

13. In this task I went through the steps in the ==Docker basics for Amazon ECS== tutorial. 

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/14.jpg)
![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/15.jpg)

14. Went through the ==Run a Serverless "Hello, World!" with AWS Lambda== guide and tested the serverless execution of the code. 

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/16.jpg)

15. The last task for this homework was to create the static website using Amazon S3 service. 
Here is the [link](http://m.obukhovskyi.s3-website.eu-central-1.amazonaws.com "AWS Progress")

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/17.jpg)
![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.2/Screenshots/18.jpg)

__Note:__ Please visit the aforementioned link in order to see the up-to-date progress with AWS.
