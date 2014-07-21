stage { 'setup':  before => Stage['main'] }
stage { 'runtime': require => Stage['main'] }
-> stage { 'setup_infra': }
-> stage { 'deploy_infra': }
-> stage { 'setup_app': }
-> stage { 'deploy_app': }
-> stage { 'deploy': }
hiera_include('classes')
