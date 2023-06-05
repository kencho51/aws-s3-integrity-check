# Review: aws-s3-integrity-check: an open-source bash tool to verify the integrity of a dataset stored on Amazon S3 (TRR-202304-02)

### Aims:
1. Test the tool's performance
2. Reproduce the test results claimed in the paper

### What did well
1. The script `aws_check_integrity.sh` can be easily executed using docker.
2. The script `aws_check_integrity.sh` has tested on a range of file size, and the processing time is reasonable.
3. The paper has mentioned its limitation on multipart uploaded datasets, and set the boundary of the tool's use case.

### Test results
| dataset                        | cmd                                                                                                                                                                                                                                  | source bucket                     | source size | processing time |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|-------------|-----------------|
| 102379                         | time docker run -v "$PWD/data/102379:/data/102379" -v "$PWD/logs/:/usr/src/logs" -v "$HOME/.aws:/root/.aws:ro" soniaruiz/aws-s3-integrity-check:latest -l /data/102379 -b testing-tf-prioritizer                                     | tf-prioritizer                    | 3.7MB       | 4.154s          |
| 102374                         | time docker run -v "$PWD/data/102374:/data/102374" -v "$PWD/logs/:/usr/src/logs" -v "$HOME/.aws:/root/.aws:ro" soniaruiz/aws-s3-integrity-check:latest -l /data/102374 -b testing-mass-spectrometry-imaging                          | testing-mass-spectrometry-imaging | 16GB        | 6m34s           |
| ukbec-unaligned-fastq(sub set) | time docker run -v "$PWD/data/ukbec-unaligned-fastq:/data/ukbec-unaligned-fastq" -v "$PWD/logs/:/usr/src/logs" -v "$HOME/.aws:/root/.aws:ro" soniaruiz/aws-s3-integrity-check:latest -l /data/102374 -b ukbec-unaligned-fastq -p ega | ukbec-unaligned-fastq             | 113GB       | 56m20.63s       |

### Problems
1. The script `aws_check_integrity.sh` can only be executed in Linux OS, which is contradict to `Testing was conducted from multiple operating systems.` mentioned in paper.
2. The script's processing time is longer than  


### Suggestions
1. The script `aws_check_integrity.sh` contains 4 errors, 14 warnings after [shellcheck](https://www.shellcheck.net/), which need to be addressed by author.
2. The paper has mentioned its limitation on multipart datasets, but should have also documented in its [repo](https://github.com/SoniaRuiz/aws-s3-integrity-check/) and also in the help message of the script.
3. The script `aws_check_integrity.sh` has typo which need to be addressed by author.
4. To implement tests on the script itself, eg. using the [bats-core](https://github.com/bats-core/bats-core).