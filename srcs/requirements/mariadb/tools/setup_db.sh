#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';FLUSH PRIVILEGES;"

sleep 2

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT}';FLUSH PRIVILEGES;"
mysqladmin -u root -p${MYSQL_ROOT} shutdown
exec "$@"
    # Using `exec` in a shell script has a specific purpose. When a script contains the `exec` command, 
    # it replaces the current shell process with the specified command, effectively ending the script at that point. 
    # Without `exec`, each line of the script is executed within the context of the script, and the script continues 
    # until it reaches the end or encounters an error.
    # In the provided script, the line with `exec mysqld_safe --bind_address="0.0.0.0"` is intended to start the MySQL 
    # server and replace the shell process with the MySQL server process. This means that once the MySQL server is started,
    #  the script essentially "hands over control" to the MySQL server, and the script itself doesn't continue running.
    # If you were to run the script without `exec`, like this:
    # ```bash
    # mysqld_safe --bind_address="0.0.0.0"
    # ```
    # The MySQL server would start, but the script would continue running any subsequent commands after the server has started.
    # In summary, using `exec` in this context is a way to seamlessly transition from the script's environment to the 
    # MySQL server's environment, and it's commonly used in scenarios where the script's purpose is to set up and start 
    # a server, and the script is not expected to perform additional actions after the server has started.
    # exec mysqld # replaces the current shell process with the MariaDB server process.
    # Running a process in the foreground allows it to be the main process (PID 1) of the container, 
    # which is important for signal handling and ensures that Docker can manage the container's lifecycle effectively. 
    # It's also beneficial for logging, as the logs from the process will be directly visible in the container's 
    # standard output and standard error streams.

    # `mysqld_safe` is a script provided by MySQL (and MariaDB, in this case) that is designed to start the MySQL server in a way 
    # that provides additional safety and recovery features. It's often used for managing the MySQL server process and handling restarts in case of failures.
    # Some key features and characteristics of `mysqld_safe` include:
    # 1. **Automatic Restart:** If the MySQL server process were to crash, `mysqld_safe` can automatically restart it. 
    # This helps in ensuring the availability of the MySQL service.
    # 2. **Logging and Error Handling:** `mysqld_safe` captures and logs error messages, making it easier to diagnose and 
    # troubleshoot issues with the MySQL server.
    # 3. **Environment Setup:** It sets up the environment for the MySQL server, handling things like setting environment 
    # variables, configuring paths, and other settings that might be needed for the server to run properly.
    # 4. **User Interaction:** `mysqld_safe` is designed to be user-friendly and provides a simple interface for starting 
    # and stopping the server. It can be run in the foreground, allowing the user to see the server's output and any error messages directly
    # In the provided script, using `mysqld_safe` is a choice made by the script author to ensure that the MySQL server is 
    # started in a controlled and recoverable manner. This is particularly useful in production environments where the 
    # reliability and recoverability of the database service are critical.
    # It's worth noting that the use of `mysqld_safe` is common in older versions of MySQL and MariaDB. In more recent versions, 
    # systemd or other init systems may be used to manage the MySQL service. Always check the documentation for the specific 
    # version of the database server you are working with to understand the recommended practices for managing the service.

    # The `--bind_address` option in the context of MySQL or MariaDB specifies the network interface on which the server should 
    # listen for incoming connections. In the provided script, the option is set to `"0.0.0.0"`, which means the MySQL server will 
    # listen on all available network interfaces.
    # Here's a breakdown of the `--bind_address="0.0.0.0"` option:
    # - **`--bind_address`:** This option is used to specify the IP address to which the MySQL server should bind. The 
    # IP address "0.0.0.0" is a special value that means "listen on all available network interfaces." It allows the server
    #  to accept connections from any IP address.
    # - **"0.0.0.0":** In the context of IP addresses, "0.0.0.0" is a wildcard address that represents all possible IP addresses. 
    # When the MySQL server is configured to bind to "0.0.0.0," it means the server will listen on all network interfaces on the machine.
    # By using `"--bind_address=0.0.0.0"`, the MySQL server is configured to accept connections from any IP address, making it 
    # accessible over the network. This is commonly used when you want the MySQL server to be reachable from remote clients. 
    # If you want the server to listen only on a specific network interface or IP address, you would replace "0.0.0.0" with the desired IP address.
    # It's important to note that while binding to all interfaces allows for greater accessibility, it also introduces potential 
    # security considerations. Proper firewall and authentication measures should be implemented to secure the MySQL server, 
    # especially if it's accessible from external networks.
