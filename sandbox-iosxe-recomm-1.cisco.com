<?xml version="1.0" ?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" xmlns:nc="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="urn:uuid:a9ee17db-ca8e-4d1c-8c6a-2902abbf1a0d">
	<data>
		<native xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-native">
			<version>16.9</version>
			<boot-start-marker/>
			<boot-end-marker/>
			<banner>
				<login>
					<banner>^C</banner>
				</login>
				<motd>
					<banner>^C</banner>
				</motd>
			</banner>
			<service>
				<timestamps>
					<debug>
						<datetime>
							<msec/>
						</datetime>
					</debug>
					<log>
						<datetime>
							<msec/>
						</datetime>
					</log>
				</timestamps>
			</service>
			<platform>
				<console xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-platform">
					<output>virtual</output>
				</console>
			</platform>
			<hostname>csr1000v-1</hostname>
			<enable>
				<secret>
					<type>5</type>
					<secret>$1$dAnr$MQbNXMNy//wugqUbtZ2vk/</secret>
				</secret>
			</enable>
			<username>
				<name>developer</name>
				<privilege>15</privilege>
				<secret>
					<encryption>5</encryption>
					<secret>$1$Anez$e3JokiVvI4unDNdZ20HEG1</secret>
				</secret>
			</username>
			<username>
				<name>mahmut1</name>
				<privilege>15</privilege>
				<secret>
					<encryption>5</encryption>
					<secret>$1$yTfw$05r1p7C9Goqu5bT20UlXz.</secret>
				</secret>
			</username>
			<username>
				<name>root</name>
				<privilege>15</privilege>
				<secret>
					<encryption>5</encryption>
					<secret>$1$mB0Z$srZ2lQWnzAC5JjFaTzJBn1</secret>
				</secret>
			</username>
			<ip>
				<domain>
					<name>cisco.com</name>
				</domain>
				<forward-protocol>
					<protocol>nd</protocol>
				</forward-protocol>
				<route>
					<ip-route-interface-forwarding-list>
						<prefix>0.0.0.0</prefix>
						<mask>0.0.0.0</mask>
						<fwd-list>
							<fwd>GigabitEthernet1</fwd>
							<interface-next-hop>
								<ip-address>10.10.20.254</ip-address>
							</interface-next-hop>
						</fwd-list>
					</ip-route-interface-forwarding-list>
				</route>
				<scp>
					<server>
						<enable/>
					</server>
				</scp>
				<ssh>
					<rsa>
						<keypair-name>ssh-key</keypair-name>
					</rsa>
					<version>2</version>
				</ssh>
				<access-list>
					<extended xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-acl">
						<name>NAT</name>
						<access-list-seq-rule>
							<sequence>10</sequence>
							<ace-rule>
								<action>permit</action>
								<protocol>ip</protocol>
								<ipv4-address>192.168.10.0</ipv4-address>
								<mask>0.0.0.255</mask>
								<dst-any/>
							</ace-rule>
						</access-list-seq-rule>
					</extended>
					<extended xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-acl">
						<name>NAT-ACL</name>
						<access-list-seq-rule>
							<sequence>10</sequence>
							<ace-rule>
								<action>permit</action>
								<protocol>ip</protocol>
								<ipv4-address>192.168.1.0</ipv4-address>
								<mask>0.0.0.255</mask>
								<dst-any/>
							</ace-rule>
						</access-list-seq-rule>
					</extended>
				</access-list>
				<http xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-http">
					<authentication>
						<local/>
					</authentication>
					<server>true</server>
					<secure-server>true</secure-server>
				</http>
				<nat xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-nat">
					<inside>
						<source>
							<list>
								<id>NAT-ACL</id>
								<interface>
									<name>GigabitEthernet1</name>
									<overload/>
								</interface>
							</list>
						</source>
					</inside>
				</nat>
			</ip>
			<interface>
				<GigabitEthernet>
					<name>1</name>
					<description>MANAGEMENT INTERFACE - DON'T TOUCH ME</description>
					<ip>
						<address>
							<primary>
								<address>10.10.20.48</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
						<nat xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-nat">
							<outside/>
						</nat>
					</ip>
					<mop>
						<enabled>false</enabled>
						<sysid>false</sysid>
					</mop>
					<negotiation xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ethernet">
						<auto>true</auto>
					</negotiation>
				</GigabitEthernet>
				<GigabitEthernet>
					<name>2</name>
					<description>mehdi is mehdi</description>
					<mop>
						<enabled>false</enabled>
						<sysid>false</sysid>
					</mop>
					<negotiation xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ethernet">
						<auto>true</auto>
					</negotiation>
				</GigabitEthernet>
				<GigabitEthernet>
					<name>3</name>
					<description>Network Interface</description>
					<shutdown/>
					<mop>
						<enabled>false</enabled>
						<sysid>false</sysid>
					</mop>
					<negotiation xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ethernet">
						<auto>true</auto>
					</negotiation>
				</GigabitEthernet>
				<Loopback>
					<name>1</name>
					<description>My first NETCONF loopback</description>
					<ip>
						<address>
							<primary>
								<address>10.1.1.1</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
					</ip>
				</Loopback>
				<Loopback>
					<name>20</name>
					<description>Compex Dev Test</description>
					<ip>
						<address>
							<primary>
								<address>192.168.20.1</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
					</ip>
				</Loopback>
				<Loopback>
					<name>21</name>
				</Loopback>
				<Loopback>
					<name>77</name>
					<ip>
						<address>
							<primary>
								<address>10.20.30.40</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
					</ip>
				</Loopback>
				<Loopback>
					<name>78</name>
					<ip>
						<address>
							<primary>
								<address>5.10.15.20</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
					</ip>
				</Loopback>
				<VirtualPortGroup>
					<name>0</name>
					<ip>
						<address>
							<primary>
								<address>192.168.1.1</address>
								<mask>255.255.255.0</mask>
							</primary>
						</address>
						<nat xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-nat">
							<inside/>
						</nat>
					</ip>
					<mop>
						<enabled>false</enabled>
						<sysid>false</sysid>
					</mop>
				</VirtualPortGroup>
			</interface>
			<control-plane/>
			<login>
				<on-success>
					<log/>
				</on-success>
			</login>
			<multilink>
				<bundle-name xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ppp">authenticated</bundle-name>
			</multilink>
			<redundancy/>
			<spanning-tree>
				<extend xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-spanning-tree">
					<system-id/>
				</extend>
			</spanning-tree>
			<subscriber>
				<templating/>
			</subscriber>
			<crypto>
				<pki xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-crypto">
					<trustpoint>
						<id>TP-self-signed-65385644</id>
						<enrollment>
							<selfsigned/>
						</enrollment>
						<revocation-check>none</revocation-check>
						<rsakeypair>
							<key-label>TP-self-signed-65385644</key-label>
						</rsakeypair>
						<subject-name>cn=IOS-Self-Signed-Certificate-65385644</subject-name>
					</trustpoint>
					<certificate>
						<chain>
							<name>TP-self-signed-65385644</name>
							<certificate>
								<serial>01</serial>
								<certtype>self-signed</certtype>
							</certificate>
						</chain>
					</certificate>
				</pki>
			</crypto>
			<router>
				<ospf xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ospf">
					<id>10</id>
					<passive-interface>
						<default/>
					</passive-interface>
					<network>
						<ip>192.168.10.0</ip>
						<mask>0.0.0.255</mask>
						<area>0</area>
					</network>
					<network>
						<ip>192.168.11.0</ip>
						<mask>0.0.0.255</mask>
						<area>0</area>
					</network>
					<network>
						<ip>192.168.12.0</ip>
						<mask>0.0.0.255</mask>
						<area>0</area>
					</network>
				</ospf>
				<ospf xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ospf">
					<id>19</id>
					<router-id>1.2.3.4</router-id>
				</ospf>
				<ospf xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ospf">
					<id>41</id>
					<network>
						<ip>41.41.41.41</ip>
						<mask>0.0.0.0</mask>
						<area>41</area>
					</network>
				</ospf>
			</router>
			<snmp-server>
				<community xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-snmp">
					<name>RO</name>
					<RO/>
				</community>
			</snmp-server>
			<license>
				<udi>
					<pid>CSR1000V</pid>
					<sn>926V75BDNRJ</sn>
				</udi>
				<accept>
					<end/>
					<user/>
					<agreement/>
				</accept>
				<boot>
					<level>
						<ax/>
					</level>
				</boot>
			</license>
			<line>
				<console>
					<first>0</first>
					<exec-timeout>
						<minutes>0</minutes>
						<seconds>0</seconds>
					</exec-timeout>
					<stopbits>1</stopbits>
				</console>
				<vty>
					<first>0</first>
					<last>4</last>
					<exec-timeout>
						<minutes>0</minutes>
						<seconds>0</seconds>
					</exec-timeout>
					<login>
						<local/>
					</login>
					<transport>
						<input>
							<input>ssh</input>
						</input>
					</transport>
				</vty>
			</line>
			<ntp>
				<server xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ntp">
					<server-list>
						<ip-address>12.12.12.12</ip-address>
					</server-list>
					<server-list>
						<ip-address>13.13.13.13</ip-address>
					</server-list>
				</server>
			</ntp>
			<iox/>
			<diagnostic xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-diagnostics">
				<bootup>
					<level>minimal</level>
				</bootup>
			</diagnostic>
		</native>
		<virtual-service-cfg-data xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-virtual-service-cfg">
			<apps>
				<app>
					<application-name>guestshell</application-name>
					<application-network-resource>
						<vnic-gateway-0>0</vnic-gateway-0>
						<virtualportgroup-guest-interface-name-1>0</virtualportgroup-guest-interface-name-1>
						<virtualportgroup-guest-ip-address-1>192.168.1.2</virtualportgroup-guest-ip-address-1>
						<virtualportgroup-guest-ip-netmask-1>255.255.255.0</virtualportgroup-guest-ip-netmask-1>
						<virtualportgroup-application-default-gateway-1>192.168.1.1</virtualportgroup-application-default-gateway-1>
						<nameserver-0>8.8.8.8</nameserver-0>
						<virtualportgroup-guest-interface-default-gateway-1>0</virtualportgroup-guest-interface-default-gateway-1>
					</application-network-resource>
				</app>
			</apps>
		</virtual-service-cfg-data>
		<licensing xmlns="http://cisco.com/ns/yang/cisco-smart-license">
			<config>
				<enable>false</enable>
				<privacy>
					<hostname>false</hostname>
					<version>false</version>
				</privacy>
				<utility>
					<utility-enable>false</utility-enable>
				</utility>
			</config>
		</licensing>
		<acl xmlns="http://openconfig.net/yang/acl">
			<acl-sets>
				<acl-set>
					<name>NAT</name>
					<type>ACL_IPV4</type>
					<config>
						<name>NAT</name>
						<type>ACL_IPV4</type>
					</config>
					<acl-entries>
						<acl-entry>
							<sequence-id>10</sequence-id>
							<config>
								<sequence-id>10</sequence-id>
							</config>
							<ipv4>
								<config>
									<source-address>192.168.10.0/24</source-address>
									<protocol xmlns:oc-acl-cisco="http://cisco.com/ns/yang/cisco-xe-openconfig-acl-ext">oc-acl-cisco:IP</protocol>
								</config>
							</ipv4>
							<transport>
								<config>
									<source-port>ANY</source-port>
									<destination-port>ANY</destination-port>
								</config>
							</transport>
							<actions>
								<config>
									<forwarding-action>ACCEPT</forwarding-action>
									<log-action>LOG_NONE</log-action>
								</config>
							</actions>
						</acl-entry>
					</acl-entries>
				</acl-set>
				<acl-set>
					<name>NAT-ACL</name>
					<type>ACL_IPV4</type>
					<config>
						<name>NAT-ACL</name>
						<type>ACL_IPV4</type>
					</config>
					<acl-entries>
						<acl-entry>
							<sequence-id>10</sequence-id>
							<config>
								<sequence-id>10</sequence-id>
							</config>
							<ipv4>
								<config>
									<source-address>192.168.1.0/24</source-address>
									<protocol xmlns:oc-acl-cisco="http://cisco.com/ns/yang/cisco-xe-openconfig-acl-ext">oc-acl-cisco:IP</protocol>
								</config>
							</ipv4>
							<transport>
								<config>
									<source-port>ANY</source-port>
									<destination-port>ANY</destination-port>
								</config>
							</transport>
							<actions>
								<config>
									<forwarding-action>ACCEPT</forwarding-action>
									<log-action>LOG_NONE</log-action>
								</config>
							</actions>
						</acl-entry>
					</acl-entries>
				</acl-set>
			</acl-sets>
		</acl>
		<interfaces xmlns="http://openconfig.net/yang/interfaces">
			<interface>
				<name>GigabitEthernet1</name>
				<config>
					<name>GigabitEthernet1</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
					<description>MANAGEMENT INTERFACE - DON'T TOUCH ME</description>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<description>MANAGEMENT INTERFACE - DON'T TOUCH ME</description>
							<enabled>true</enabled>
						</config>
						<ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
							<addresses>
								<address>
									<ip>10.10.20.48</ip>
									<config>
										<ip>10.10.20.48</ip>
										<prefix-length>24</prefix-length>
									</config>
								</address>
							</addresses>
						</ipv4>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
				<ethernet xmlns="http://openconfig.net/yang/interfaces/ethernet">
					<config>
						<mac-address>00:50:56:bf:93:79</mac-address>
						<auto-negotiate>true</auto-negotiate>
					</config>
				</ethernet>
			</interface>
			<interface>
				<name>GigabitEthernet2</name>
				<config>
					<name>GigabitEthernet2</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
					<description>mehdi is mehdi</description>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<description>mehdi is mehdi</description>
							<enabled>true</enabled>
						</config>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
				<ethernet xmlns="http://openconfig.net/yang/interfaces/ethernet">
					<config>
						<mac-address>00:50:56:bf:ea:76</mac-address>
						<auto-negotiate>true</auto-negotiate>
					</config>
				</ethernet>
			</interface>
			<interface>
				<name>GigabitEthernet3</name>
				<config>
					<name>GigabitEthernet3</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
					<description>Network Interface</description>
					<enabled>false</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<description>Network Interface</description>
							<enabled>false</enabled>
						</config>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
				<ethernet xmlns="http://openconfig.net/yang/interfaces/ethernet">
					<config>
						<mac-address>00:50:56:bf:16:51</mac-address>
						<auto-negotiate>true</auto-negotiate>
					</config>
				</ethernet>
			</interface>
			<interface>
				<name>Loopback1</name>
				<config>
					<name>Loopback1</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
					<description>My first NETCONF loopback</description>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<description>My first NETCONF loopback</description>
							<enabled>true</enabled>
						</config>
						<ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
							<addresses>
								<address>
									<ip>10.1.1.1</ip>
									<config>
										<ip>10.1.1.1</ip>
										<prefix-length>24</prefix-length>
									</config>
								</address>
							</addresses>
						</ipv4>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
			</interface>
			<interface>
				<name>Loopback20</name>
				<config>
					<name>Loopback20</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
					<description>Compex Dev Test</description>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<description>Compex Dev Test</description>
							<enabled>true</enabled>
						</config>
						<ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
							<addresses>
								<address>
									<ip>192.168.20.1</ip>
									<config>
										<ip>192.168.20.1</ip>
										<prefix-length>24</prefix-length>
									</config>
								</address>
							</addresses>
						</ipv4>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
			</interface>
			<interface>
				<name>Loopback21</name>
				<config>
					<name>Loopback21</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<enabled>true</enabled>
						</config>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
			</interface>
			<interface>
				<name>Loopback77</name>
				<config>
					<name>Loopback77</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<enabled>true</enabled>
						</config>
						<ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
							<addresses>
								<address>
									<ip>10.20.30.40</ip>
									<config>
										<ip>10.20.30.40</ip>
										<prefix-length>24</prefix-length>
									</config>
								</address>
							</addresses>
						</ipv4>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
			</interface>
			<interface>
				<name>Loopback78</name>
				<config>
					<name>Loopback78</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
					<enabled>true</enabled>
				</config>
				<subinterfaces>
					<subinterface>
						<index>0</index>
						<config>
							<index>0</index>
							<enabled>true</enabled>
						</config>
						<ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
							<addresses>
								<address>
									<ip>5.10.15.20</ip>
									<config>
										<ip>5.10.15.20</ip>
										<prefix-length>24</prefix-length>
									</config>
								</address>
							</addresses>
						</ipv4>
						<ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
							<config>
								<enabled>false</enabled>
							</config>
						</ipv6>
					</subinterface>
				</subinterfaces>
			</interface>
			<interface>
				<name>VirtualPortGroup0</name>
				<config>
					<name>VirtualPortGroup0</name>
					<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:propVirtual</type>
					<enabled>true</enabled>
				</config>
			</interface>
		</interfaces>
		<network-instances xmlns="http://openconfig.net/yang/network-instance">
			<network-instance>
				<name>default</name>
				<config>
					<name>default</name>
					<type xmlns:oc-ni-types="http://openconfig.net/yang/network-instance-types">oc-ni-types:DEFAULT_INSTANCE</type>
					<description>default-vrf [read-only]</description>
				</config>
				<tables>
					<table>
						<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</protocol>
						<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						<config>
							<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</protocol>
							<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						</config>
					</table>
					<table>
						<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</protocol>
						<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV6</address-family>
						<config>
							<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</protocol>
							<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV6</address-family>
						</config>
					</table>
					<table>
						<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</protocol>
						<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						<config>
							<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</protocol>
							<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						</config>
					</table>
					<table>
						<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</protocol>
						<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						<config>
							<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</protocol>
							<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV4</address-family>
						</config>
					</table>
					<table>
						<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</protocol>
						<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV6</address-family>
						<config>
							<protocol xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</protocol>
							<address-family xmlns:oc-types="http://openconfig.net/yang/openconfig-types">oc-types:IPV6</address-family>
						</config>
					</table>
				</tables>
				<protocols>
					<protocol>
						<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
						<name>10</name>
						<config>
							<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
							<name>10</name>
						</config>
					</protocol>
					<protocol>
						<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
						<name>19</name>
						<config>
							<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
							<name>19</name>
						</config>
					</protocol>
					<protocol>
						<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
						<name>41</name>
						<config>
							<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:OSPF</identifier>
							<name>41</name>
						</config>
					</protocol>
					<protocol>
						<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</identifier>
						<name>DEFAULT</name>
						<config>
							<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:STATIC</identifier>
							<name>DEFAULT</name>
						</config>
						<static-routes>
							<static>
								<prefix>0.0.0.0/0</prefix>
								<config>
									<prefix>0.0.0.0/0</prefix>
								</config>
								<next-hops>
									<next-hop>
										<index>GigabitEthernet1_10.10.20.254</index>
										<config>
											<index>GigabitEthernet1_10.10.20.254</index>
											<next-hop>10.10.20.254</next-hop>
										</config>
										<interface-ref>
											<config>
												<interface>GigabitEthernet1</interface>
											</config>
										</interface-ref>
									</next-hop>
								</next-hops>
							</static>
						</static-routes>
					</protocol>
					<protocol>
						<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</identifier>
						<name>DEFAULT</name>
						<config>
							<identifier xmlns:oc-pol-types="http://openconfig.net/yang/policy-types">oc-pol-types:DIRECTLY_CONNECTED</identifier>
							<name>DEFAULT</name>
						</config>
					</protocol>
				</protocols>
			</network-instance>
		</network-instances>
		<interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
			<interface>
				<name>GigabitEthernet1</name>
				<description>MANAGEMENT INTERFACE - DON'T TOUCH ME</description>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>10.10.20.48</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>GigabitEthernet2</name>
				<description>mehdi is mehdi</description>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>GigabitEthernet3</name>
				<description>Network Interface</description>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
				<enabled>false</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>Loopback1</name>
				<description>My first NETCONF loopback</description>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>10.1.1.1</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>Loopback20</name>
				<description>Compex Dev Test</description>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>192.168.20.1</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>Loopback21</name>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>Loopback77</name>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>10.20.30.40</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>Loopback78</name>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:softwareLoopback</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>5.10.15.20</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
			<interface>
				<name>VirtualPortGroup0</name>
				<type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:propVirtual</type>
				<enabled>true</enabled>
				<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
					<address>
						<ip>192.168.1.1</ip>
						<netmask>255.255.255.0</netmask>
					</address>
				</ipv4>
				<ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
			</interface>
		</interfaces>
		<nacm xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-acm">
			<enable-nacm>true</enable-nacm>
			<read-default>deny</read-default>
			<write-default>deny</write-default>
			<exec-default>deny</exec-default>
			<enable-external-groups>true</enable-external-groups>
			<rule-list>
				<name>admin</name>
				<group>PRIV15</group>
				<rule>
					<name>permit-all</name>
					<module-name>*</module-name>
					<access-operations>*</access-operations>
					<action>permit</action>
				</rule>
			</rule-list>
		</nacm>
		<routing xmlns="urn:ietf:params:xml:ns:yang:ietf-routing">
			<routing-instance>
				<name>default</name>
				<description>default-vrf [read-only]</description>
				<routing-protocols>
					<routing-protocol>
						<type xmlns:ospf="urn:ietf:params:xml:ns:yang:ietf-ospf">ospf:ospfv2</type>
						<name>10</name>
						<ospf xmlns="urn:ietf:params:xml:ns:yang:ietf-ospf">
							<instance>
								<af xmlns:rt="urn:ietf:params:xml:ns:yang:ietf-routing">rt:ipv4</af>
								<nsr>
									<enable>false</enable>
								</nsr>
								<auto-cost>
									<enable>false</enable>
								</auto-cost>
								<redistribution xmlns="urn:ietf:params:xml:ns:yang:cisco-ospf">
									<rip/>
								</redistribution>
							</instance>
						</ospf>
					</routing-protocol>
					<routing-protocol>
						<type xmlns:ospf="urn:ietf:params:xml:ns:yang:ietf-ospf">ospf:ospfv2</type>
						<name>19</name>
						<ospf xmlns="urn:ietf:params:xml:ns:yang:ietf-ospf">
							<instance>
								<af xmlns:rt="urn:ietf:params:xml:ns:yang:ietf-routing">rt:ipv4</af>
								<router-id>1.2.3.4</router-id>
								<nsr>
									<enable>false</enable>
								</nsr>
								<auto-cost>
									<enable>false</enable>
								</auto-cost>
								<redistribution xmlns="urn:ietf:params:xml:ns:yang:cisco-ospf">
									<rip/>
								</redistribution>
							</instance>
						</ospf>
					</routing-protocol>
					<routing-protocol>
						<type xmlns:ospf="urn:ietf:params:xml:ns:yang:ietf-ospf">ospf:ospfv2</type>
						<name>41</name>
						<ospf xmlns="urn:ietf:params:xml:ns:yang:ietf-ospf">
							<instance>
								<af xmlns:rt="urn:ietf:params:xml:ns:yang:ietf-routing">rt:ipv4</af>
								<nsr>
									<enable>false</enable>
								</nsr>
								<auto-cost>
									<enable>false</enable>
								</auto-cost>
								<redistribution xmlns="urn:ietf:params:xml:ns:yang:cisco-ospf">
									<rip/>
								</redistribution>
							</instance>
						</ospf>
					</routing-protocol>
					<routing-protocol>
						<type>static</type>
						<name>1</name>
						<static-routes>
							<ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ipv4-unicast-routing">
								<route>
									<destination-prefix>0.0.0.0/0</destination-prefix>
									<next-hop>
										<outgoing-interface>GigabitEthernet1</outgoing-interface>
									</next-hop>
								</route>
							</ipv4>
						</static-routes>
					</routing-protocol>
				</routing-protocols>
			</routing-instance>
		</routing>
	</data>
</rpc-reply>
