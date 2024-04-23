## bbot parser
The sole purpose of this script is to parse bbot output to be more organized. It does this by pulling all the data for each type value and puts it in its own JSON object and creates a separate file. Additionally, it will, if you forgot to specify json as the output when running bbot, convert the NDJSON format to JSON.

## Install

There is nothing to install, just download the script. All dependencies should be already installed with a default installation of python.

## Usage

```python
python3 parse_output.py -j output.ndjson

```

This will take NDJSON output from bbot and convert it into a json file which will be saved as `output.json`.


```python

python3 parse_output.py -f <bbot converted json>

```

With providing the converted json file this will pull out all data relevant for a type value and place it in a new file. For example if you have a type value of `DNS_NAME` in your JSON it will create a file called DNS_NAME_LISTING.json which will only contain JSON objects with the type of `DNS_NAME`. Below is an example of all the files that will be created as a result.

<img src=image.png>
