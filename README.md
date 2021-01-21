**[Help make Kaltura CE better! Participate in the Kaltura CE Survey](http://surveys.kaltura.org/index.php/877436/lang-en).**

## EXPERIMANTAL FORK!
builds [b0r7/kaltura-server](https://hub.docker.com/repository/docker/b0r7/kaltura-server)


[![License](https://img.shields.io/badge/license-AGPLv3-blue.svg)](http://www.gnu.org/licenses/agpl-3.0.html)
# Kaltura Installation Packages Project
To enable the use of standard binary packages and package managers when deploying the Kaltura Video Platform Community Edition.

This project features official deployment packages to install the Kaltura Video Platform on a server or cluster environments using native OS package managers.

* **[Learn more & keep track on the project page](http://kaltura.github.io/platform-install-packages/)**.    
* [Read Latest Project Status](https://forum.kaltura.org/c/new-release-updates).
* [See the Build and Test Reports on the Continuous Integration system](http://installrepo.kaltura.org/reports/ci/).    
+ Visit the [Kaltura Video Platform Packages CI Project](https://github.com/kaltura/platform-continuous-integration) and help by contributing automatic sanity tests.
* Track the development of the [Kaltura Video Platform Packages CI Project](https://github.com/kaltura/platform-continuous-integration).
* [Kaltura Inc.](http://corp.kaltura.com) also provides commercial solutions and services including pro-active platform monitoring, applications, SLA, 24/7 support and professional services. If you're looking for a commercially supported video platform  with integrations to commercial encoders, streaming servers, eCDN, DRM and more - Start a [Free Trial of the Kaltura.com Hosted Platform](http://corp.kaltura.com/free-trial) or learn more about [Kaltura' Commercial OnPrem Edition™](http://corp.kaltura.com/Deployment-Options/Kaltura-On-Prem-Edition). For existing RPM based users, Kaltura offers commercial upgrade options.
* Please refer to the [Frequently Asked Questions document](https://github.com/kaltura/platform-install-packages/blob/master/doc/kaltura-packages-faq.md) before opening new issues or forum threads.

## How you can help
Thank you for running Kaltura and pushing the limits of online video! By joining the Kaltura community and contributing you will help grow the platform, and keeping it open, stable and accessible to all. You can contribute meaningfully to the project from day one:    

+ By contributing sanity tests that verify overall platform stability - [Join the Kaltura CI Project](https://github.com/kaltura/platform-continuous-integration).
+ By solving [simple tasks and challenges that advance the platform roadmap](http://bit.ly/kaltura-tasks).
+ By testing the platform components, including various deployment settings and environments, and network settings, [reporting issues and feature requests](https://github.com/kaltura/platform-install-packages/issues) and [pushing pull-requests](https://help.github.com/articles/creating-a-pull-request) that patch bugs.
+ By creating [documentation](https://github.com/kaltura/platform-install-packages/tree/master/doc), demos and examples.
+ By translating the Kaltura Platform documentation.
+ By filling out the [Community Survey](https://www.kaltura.com/tiny/u08ud)

Contact the authors or email community@kaltura.org if you have other ideas.

### Watch the alpha announcement video:
[![Watch the alpha announcement video](http://kaltura.github.io/platform-install-packages/images/news/1st-alpha-video-thumb.png "Watch the alpha announcement video")](http://bit.ly/1fIsdmY)


## Documentation and Guides

* [**Frequently Asked Questions**](doc/kaltura-packages-faq.md)
* [Single-server All-In-One RedHat based Linux distros Installation (including FC, RHEL and CentOS)](doc/install-kaltura-redhat-based.md).
* [Single-server All-In-One deb based distros Installation (Debian: Jessie [8]; Ubuntu: Trusty [14.04])](doc/install-kaltura-deb-based.md).
* [Single-server All-In-One Ubuntu Xenial (16.04) Installation](doc/install-kaltura-xenial.md).
* [Single-server All-In-One Ubuntu Focal (20.04) Installation](doc/install-kaltura-focal.md).
* [Single-server All-In-One Docker container Installation](doc/install-docker.md).
* [Deploying a Kaltura Cluster (RPM)](doc/rpm-cluster-deployment-instructions.md)
* [Deploying a Kaltura Cluster (deb)](doc/deb-cluster-deployment-instructions.md)
* [Deploying Kaltura using Opscode Chef (RPM)](doc/rpm-chef-cluster-deployment.md)
* [Deploying Kaltura using Vagrant (RPM)](vagrant)
* [Upgrade from pre-RPM versions](doc/kaltura-updater)
* [Setting up Kaltura Video Platform monitoring](doc/platform-monitors.md)
* [Required Open Ports to run Kaltura](doc/kaltura-required-ports.md)
* [Deploy Local Repository for Offline Install](doc/deploy-local-rpm-repo-offline-install.md)



## License and Copyright Information
All code in this project is released under the [AGPLv3 license](http://www.gnu.org/licenses/agpl-3.0.html) unless a different license for a particular library is specified in the applicable library path. 

Copyright © Kaltura Inc. All rights reserved.

Authors [@jessp01](https://github.com/jessp01), [@zoharbabin](https://github.com/zoharbabin) and many others.

Contributors: [@DBezemer](https://github.com/DBezemer), [@fugazi73](https://github.com/fugazi73), [@blackyboy](https://github.com/blackyboy), [@Ronileco](https://github.com/Ronileco), [@jpluijmers](https://github.com/jpluijmers), [@smartdrive](https://github.com/smartdrive), [@baiyou2014](https://github.com/baiyou2014), [@krarey](https://github.com/krarey), [@nzimas](https://github.com/nzimas), [@nshulakov](https://github.com/nshulakov), [@joerace](https://github.com/joerace), [@iddrew](https://github.com/iddrew), [@ironsizide](https://github.com/ironsizide), [@angober](https://github.com/angober), [@nviera777](https://github.com/nviera777), [@bnelson796](https://github.com/bnelson796), [@cschaub](https://github.com/cschaub), [@mobcdi](https://github.com/mobcdi), [@flipmcf](https://github.com/flipmcf), [@dudyk](https://github.com/dudyk), [@vadimtar](https://github.com/vadimtar), [@corematter](https://github.com/corematter),[@visomar](https://github.com/visomar),[@AquileaSFX](https://github.com/AquileaSFX),[@carise](https://github.com/carise),[@shojikajita](https://github.com/shojikajita),[@suhastnex](https://github.com/suhastnex),[@ElGabbu](https://github.com/ElGabbu),[@OriHoch](https://github.com/OriHoch), [@tan-tan-kanarek](https://github.com/tan-tan-kanarek), [@kobimichaeli](https://github.com/kobimichaeli), [@leosuncin](https://github.com/leosuncin), [@wzur](https://github.com/wzur)

Not on the list but should be? we try to update it as frequently as possible but if you contributed a code fix, feature or reported an issue that got fixed, do write to us at community@kaltura.com and we'll be happy to add you.
