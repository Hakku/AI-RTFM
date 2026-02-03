---
type: knowledge_base_article
kernel: kb
kb_id: KB-0042
title: VPN Connection Fails with Error 809 or 628
owner: @it-support
created: 2026-02-15
last_updated: 2026-04-18
review_cycle: 30_days
category: networking
subcategory: vpn
difficulty: easy
audience: [end-users]
status: published
tags: [vpn, windows, troubleshoot, end-user, remote-work]
helpful_count: 247
view_count: 1893
---

# VPN Connection Fails with Error 809 or 628

**Category:** Networking > VPN  
**Applies to:** Windows 10/11  
**Last verified:** 2026-04-18

## Problem Description

You're trying to connect to the company VPN from Windows, but the connection fails with one of these error messages:

- **Error 809:** "The network connection between your computer and the VPN server could not be established"
- **Error 628:** "The connection was terminated by the remote computer before it could be completed"

This typically happens when connecting from home networks, coffee shops, or hotels.

### Common Symptoms

Users experiencing this issue typically see:

- VPN connection starts but fails after 10-30 seconds
- Error message appears: "Error 809" or "Error 628"
- Other internet connections work fine (web browsing, email)
- VPN worked before but suddenly stopped

### Affected Systems

- **Operating System:** Windows 10 (all versions), Windows 11
- **VPN Client:** Built-in Windows VPN client or Cisco AnyConnect
- **Network:** Usually home WiFi, public WiFi, or mobile hotspot
- **VPN Protocol:** L2TP/IPsec or IKEv2

## Quick Solution

**TL;DR:** Your router/firewall is blocking VPN ports. Enable UDP ports 500, 1701, and 4500.

1. Log in to your router (usually http://192.168.1.1)
2. Find "Port Forwarding" or "Firewall" settings
3. Allow UDP ports: 500, 1701, 4500
4. Restart router
5. Try VPN again

**This should resolve the issue in 80% of cases. If not, see detailed steps below.**

---

## Detailed Solution

### Method 1: Fix Router Port Blocking (Most Common - 80% Success Rate)

**Time required:** ~10 minutes  
**Difficulty:** Easy

This is the most common cause. Your home router is blocking the VPN protocol ports.

#### Prerequisites

- [ ] Admin access to your router (username/password)
- [ ] Router IP address (usually 192.168.1.1 or 192.168.0.1)

#### Steps

1. **Find Your Router IP Address**
   
   - Press `Windows Key + R`
   - Type `cmd` and press Enter
   - Type: `ipconfig`
   - Look for "Default Gateway" - this is your router IP (e.g., 192.168.1.1)

2. **Log in to Router**
   
   - Open web browser
   - Go to: `http://[your-router-ip]` (e.g., http://192.168.1.1)
   - Enter router username/password
   
   **Common default credentials:**
   - Username: `admin`, Password: `admin`
   - Username: `admin`, Password: `password`
   - Check bottom of router for credentials

3. **Enable VPN Passthrough**
   
   Look for one of these menu options:
   - "VPN Passthrough"
   - "Advanced Settings" → "VPN"
   - "Security" → "VPN"
   - "Firewall" → "VPN Passthrough"
   
   **Enable these:**
   - ✅ IPSec Passthrough
   - ✅ L2TP Passthrough
   - ✅ PPTP Passthrough (if available)

4. **Save Settings and Reboot Router**
   
   - Click "Save" or "Apply"
   - Wait 30 seconds
   - Power cycle router (unplug, wait 10 seconds, plug back in)
   - Wait 2 minutes for router to fully boot

5. **Test VPN Connection**
   
   - Open VPN client
   - Try to connect
   - Should work now!

#### Verification

After completing these steps:

- [ ] VPN connects successfully
- [ ] Connection stays active (doesn't drop after 30 seconds)
- [ ] Can access company resources (e.g., shared drives, internal sites)

**Expected result:** VPN connects within 10-15 seconds, no error messages.

---

### Method 2: Modify Windows Registry (If Method 1 Didn't Work)

**⚠️ Moderate difficulty - involves Registry editing**

**Use this if Method 1 didn't work and you're behind NAT (most home networks)**

**Time required:** ~5 minutes  
**Difficulty:** Medium

#### Steps

1. **Backup Registry (Important!)**
   
   - Press `Windows Key + R`
   - Type `regedit` and press Enter
   - Click "File" → "Export"
   - Save as `registry-backup-[today's-date].reg`

2. **Navigate to Registry Key**
   
   Go to:
````
   HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent
````

3. **Create New Value**
   
   - Right-click in right pane → "New" → "DWORD (32-bit) Value"
   - Name it: `AssumeUDPEncapsulationContextOnSendRule`
   - Double-click it
   - Set Value to: `2`
   - Click OK

4. **Restart Computer**
   
   - Save all work
   - Restart Windows
   - DO NOT just log out - must fully restart

5. **Test VPN Connection**
   
   After restart, try connecting to VPN again.

#### Verification

- [ ] Registry value created successfully
- [ ] Computer restarted
- [ ] VPN connects without Error 809/628

---

### Method 3: Use Different VPN Protocol (Alternative Solution)

**If you're on a restrictive network (hotel, public WiFi)**

**Time required:** ~2 minutes  
**Difficulty:** Easy

Some networks block L2TP/IPsec entirely. Switch to a different protocol.

#### Steps

1. **Open VPN Connection Settings**
   
   - Settings → Network & Internet → VPN
   - Click on your VPN connection
   - Click "Advanced options"

2. **Change VPN Type**
   
   - Click "Edit"
   - Under "VPN type", select:
     - **Option 1:** IKEv2 (recommended)
     - **Option 2:** SSTP (works through most firewalls)
   - Click "Save"

3. **Reconnect**
   
   Try connecting again with new protocol.

**Why this works:** Different protocols use different ports. SSTP uses port 443 (HTTPS) which is rarely blocked.

---

## Why This Happens

**Root Cause:**
VPN protocols (especially L2TP/IPsec) need specific network ports to be open. Many routers and firewalls block these ports by default for "security".

**Technical Explanation:**
- L2TP/IPsec requires UDP ports 500 (IKE), 1701 (L2TP), and 4500 (NAT-T)
- Home routers often block these to prevent "unauthorized" VPN servers
- NAT (Network Address Translation) can interfere with IPsec ESP (protocol 50)
- The registry fix tells Windows to assume UDP encapsulation is needed

**Common Triggers:**
- New router or router firmware update
- Changed WiFi network (moved from office to home)
- ISP changed settings remotely
- Windows update changed VPN configuration

---

## Prevention

To avoid this issue in the future:

- **Keep router VPN Passthrough enabled** - Don't disable it when troubleshooting other issues
- **Use IKEv2 or SSTP** - More firewall-friendly than L2TP
- **Test VPN immediately after router changes** - Catch issues early
- **Document your router settings** - Take screenshots so you can restore them

---

## Troubleshooting

### If the solution doesn't work:

**Check these first:**

1. **Verify VPN Server is Reachable**
   
   - Open Command Prompt
   - Type: `ping vpn.company.com`
   - If "Request timed out" → Network issue or VPN server down
   - Contact IT support if ping fails

2. **Check VPN Credentials**
   
   - Username/password might have expired
   - Try logging into company portal to verify credentials
   - Reset password if needed

3. **Firewall/Antivirus Blocking**
   
   - Temporarily disable Windows Firewall (test only!)
   - Right-click antivirus icon → Disable protection (5 minutes)
   - Try VPN again
   - If works → Add VPN as firewall/antivirus exception

### Error Messages

#### Error: "Error 789: The L2TP connection attempt failed"

**Meaning:** Wrong VPN settings or pre-shared key mismatch

**Solution:**
1. Verify VPN server address is correct
2. Check if pre-shared key is configured (if required)
3. Contact IT support for correct settings

#### Error: "Error 812: The connection was prevented due to a policy"

**Meaning:** Your Windows security policy blocks VPN

**Solution:**
1. This is often on company-managed laptops
2. Contact IT support - they need to update Group Policy
3. Cannot be fixed by end-user

#### Error: "Can't connect to VPN" (no error code)

**Meaning:** Generic connection failure

**Solution:**
1. Check internet connection (open a website)
2. Restart VPN client
3. Restart computer
4. If still failing → contact IT support

---

## Still Having Issues?

If none of the above solutions work:

### Option 1: Collect Diagnostic Information

Before contacting support, gather:

- [ ] Screenshot of the exact error message
- [ ] Error code (809, 628, etc.)
- [ ] Your location (home/office/coffee shop)
- [ ] Internet connection type (WiFi/Ethernet/mobile hotspot)
- [ ] When the problem started
- [ ] Whether VPN ever worked on this network
- [ ] Router model (if at home)

### Option 2: Contact IT Support

**For urgent VPN access:**
- 📧 Email: it-support@company.com
- 💬 Slack: #it-support channel
- 📞 Phone: +1-555-0100 ext. 1234 (8 AM - 6 PM EST)

**For non-urgent issues:**
- 🎫 Create ticket: https://helpdesk.company.com
- Expected response: Within 4 business hours

**Include this KB article number in your ticket:** KB-0042

### Option 3: Use Alternative Access Method

**If VPN is urgent and troubleshooting takes too long:**

1. **Web-based access:**
   - Go to: https://portal.company.com
   - Use single sign-on
   - Access most company resources via browser

2. **Mobile hotspot:**
   - Some cellular networks don't block VPN
   - Use your phone's hotspot as temporary workaround

3. **Work from office:**
   - If at all possible, work from office until VPN fixed

---

## Related Articles

- [KB-0015: How to Set Up VPN on Windows](../kb/vpn-setup-windows.md)
- [KB-0033: VPN Keeps Disconnecting](../kb/vpn-disconnecting.md)
- [KB-0051: VPN Speed is Slow](../kb/vpn-slow-speed.md)
- [KB-0067: Connect to VPN from Mac](../kb/vpn-mac-setup.md)

---

## Additional Resources

**Official Documentation:**
- [Microsoft VPN Troubleshooting Guide](https://docs.microsoft.com/en-us/windows-server/remote/remote-access/vpn/vpn-troubleshooting)
- [Company VPN Setup Guide](https://intranet.company.com/vpn-guide)

**Video Tutorials:**
- [Video: How to Fix VPN Error 809](https://www.youtube.com/watch?v=example) (5 min)

**Community Forums:**
- [r/VPN subreddit](https://reddit.com/r/VPN)
- Company Slack: #remote-work channel

---

## Feedback

**Was this article helpful?**

👍 Yes (247) | 👎 No (18)

**Common feedback:**
- "Method 1 worked perfectly! Thanks!" - @user1
- "Registry fix solved it after router changes didn't work" - @user2
- "Would be helpful to add screenshots of router settings" - @user3 *(noted for next update)*

[Leave feedback](https://helpdesk.company.com/kb/KB-0042/feedback)

---

## Document History

**Version History:**
- v1.0 (2026-02-15): Initial creation
- v1.1 (2026-03-10): Added Method 3 (protocol switching)
- v1.2 (2026-04-01): Added screenshots for router login
- v1.3 (2026-04-18): Updated for Windows 11, added Error 628

**Last Verified:** 2026-04-18 (all solutions tested on Windows 11 23H2)
**Next Review:** 2026-05-18 (30 days)

**Verified by:** @it-support team

**Statistics:**
- Total views: 1,893
- Helpful votes: 247 (93% helpful rate)
- Support tickets closed referencing this: 156
- Average resolution time: 12 minutes (down from 45 minutes before article)

---

**Keywords for search:** vpn error 809, vpn error 628, vpn won't connect windows, l2tp failed, ipsec connection failed, remote work vpn issues, work from home vpn