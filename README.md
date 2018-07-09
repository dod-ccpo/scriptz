# scriptz

ATAT's implementation of [Scripts to Rule Them All](https://github.com/github/scripts-to-rule-them-all).

## Requirements

### python

Install python3, if it's not installed already.

#### Ubuntu 18.04 Instructions

Install pip.

```
sudo apt install python3-distutils
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```

Install pipenv.

```
pip install --user pipenv
```

### postgres
Install postgres version 9.4+.
Connection string should be in an environment variable named `DATABASE_URI`.
