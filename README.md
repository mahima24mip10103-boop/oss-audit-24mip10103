# oss-audit-24mip10103

**Student:** mahima patharia  
**Registration Number:** 24mip10103
**Course:** Open Source Software — OSS NGMC  
**Chosen Software:** Git  

---

## Scripts

| File | What it does |
|------|-------------|
| `script1_system_identity.sh` | Displays system info — distro, kernel, user, uptime, date |
| `script2_package_inspector.sh` | Checks if a package is installed and shows version/license details |
| `script3_disk_permission_auditor.sh` | Audits permissions and disk usage for system directories |
| `script4_log_analyzer.sh` | Reads a log file and counts keyword occurrences |
| `script5_manifesto_generator.sh` | Asks 3 questions and writes a personal open-source manifesto |

---

## How to Run

**Step 1 — Make scripts executable:**
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

**Step 2 — Run each script:**
```bash
./script1_system_identity.sh

./script2_package_inspector.sh
./script2_package_inspector.sh firefox

./script3_disk_permission_auditor.sh

./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/auth.log warning

./script5_manifesto_generator.sh
```

---

## Dependencies

All scripts use standard bash utilities available by default on any Linux system — `uname`, `whoami`, `uptime`, `date`, `ls`, `du`, `grep`, `awk`, `cut`, `tail`, `wc`.

Script 2 requires either `rpm` (Fedora/RHEL) or `dpkg`/`apt-cache` (Ubuntu/Debian).

---

## License

Git is released under the GNU General Public License v2 (GPL v2).
