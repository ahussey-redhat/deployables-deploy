# ToDo
- [X] Workout how to handle reboot after kickstart install
    - Maybe reboot --eject
        - But the USB has to be removed
    - Or '[ENTER]` followed by pulling out the USB
- [X] Modify output
    - Decrease verbosity for the OCP deployment
- [X] Specify MAC address of bond0 for witness-node during kickstart
- [X] Add static routes for RHELX VMs for the pod network
- [ ] Async tasks for long running tasks
  ```yaml
    - name: Run an async task
    ansible.builtin.yum:
        name: docker-io
        state: present
    async: 1000
    poll: 0
    register: yum_sleeper

    - name: Check on an async task
    async_status:
        jid: "{{ yum_sleeper.ansible_job_id }}"
    register: job_result
    until: job_result.finished
    retries: 100
    delay: 10
  ```