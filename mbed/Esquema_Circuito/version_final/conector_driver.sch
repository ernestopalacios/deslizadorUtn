<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="wirepad">
<packages>
<package name="BANANA">
<wire x1="-4" y1="4" x2="4" y2="4" width="0.127" layer="21"/>
<wire x1="4" y1="4" x2="4" y2="-4" width="0.127" layer="21"/>
<wire x1="4" y1="-4" x2="-4" y2="-4" width="0.127" layer="21"/>
<wire x1="-4" y1="-4" x2="-4" y2="4" width="0.127" layer="21"/>
<pad name="BANANA$1" x="0" y="0" drill="2" diameter="6.4516" shape="octagon"/>
<text x="-3" y="5" size="1.9304" layer="25">&gt;NAME</text>
</package>
<package name="3,81/1,4">
<description>&lt;b&gt;THROUGH-HOLE PAD&lt;/b&gt;</description>
<wire x1="1.905" y1="-1.27" x2="1.905" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.905" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.905" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.905" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.905" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.27" width="0.1524" layer="51"/>
<pad name="1" x="0" y="0" drill="1.397" diameter="3.81" shape="octagon"/>
<text x="-1.905" y="2.286" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="1.2" size="0.0254" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="BANANA">
<wire x1="-7.62" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<pin name="BANANA$1" x="0" y="0" length="middle" rot="R180"/>
</symbol>
<symbol name="PAD">
<wire x1="-1.016" y1="1.016" x2="1.016" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-1.016" x2="1.016" y2="1.016" width="0.254" layer="94"/>
<text x="-1.143" y="1.8542" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.143" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="P" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BANANA">
<gates>
<gate name="G$1" symbol="BANANA" x="5.08" y="0"/>
</gates>
<devices>
<device name="" package="BANANA">
<connects>
<connect gate="G$1" pin="BANANA$1" pad="BANANA$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3,81/1,4" prefix="PAD" uservalue="yes">
<description>&lt;b&gt;THROUGH-HOLE PAD&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="PAD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3,81/1,4">
<connects>
<connect gate="1" pin="P" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-panduit">
<description>&lt;b&gt;Panduit Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="057-010-0">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
angled</description>
<wire x1="-1.9" y1="-0.23" x2="-1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-0.23" x2="1.9" y2="-0.23" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-0.23" x2="1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-5.8" y1="5.22" x2="-5.1" y2="3.25" width="0.4064" layer="21"/>
<wire x1="-5.1" y1="3.25" x2="-4.4" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-4.4" y1="5.22" x2="-5.8" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-10.21" y1="-2.54" x2="-10.21" y2="5.86" width="0.2032" layer="21"/>
<wire x1="10.21" y1="5.86" x2="10.21" y2="-2.44" width="0.2032" layer="21"/>
<wire x1="-10.16" y1="-2.54" x2="-7.62" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-7.62" y1="-2.54" x2="-7.62" y2="-5.98" width="0.2032" layer="21"/>
<wire x1="10.16" y1="-2.54" x2="7.62" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="7.62" y1="-2.54" x2="7.62" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="7.61" y1="-6.04" x2="-7.61" y2="-6.04" width="0.2032" layer="21"/>
<wire x1="-10.21" y1="5.86" x2="10.21" y2="5.86" width="0.2032" layer="21"/>
<pad name="1" x="-5.08" y="-5.08" drill="1" shape="octagon"/>
<pad name="2" x="-5.08" y="-2.54" drill="1" shape="octagon"/>
<pad name="3" x="-2.54" y="-5.08" drill="1" shape="octagon"/>
<pad name="4" x="-2.54" y="-2.54" drill="1" shape="octagon"/>
<pad name="5" x="0" y="-5.08" drill="1" shape="octagon"/>
<pad name="6" x="0" y="-2.54" drill="1" shape="octagon"/>
<pad name="7" x="2.54" y="-5.08" drill="1" shape="octagon"/>
<pad name="8" x="2.54" y="-2.54" drill="1" shape="octagon"/>
<pad name="9" x="5.08" y="-5.08" drill="1" shape="octagon"/>
<pad name="10" x="5.08" y="-2.54" drill="1" shape="octagon"/>
<text x="-6.35" y="-8.89" size="1.778" layer="25">&gt;NAME</text>
<text x="-8.89" y="6.35" size="1.778" layer="27">&gt;VALUE</text>
<hole x="-13.48" y="3.66" drill="2.8"/>
<hole x="13.73" y="3.66" drill="2.8"/>
</package>
<package name="057-010-1">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
straight</description>
<wire x1="-1.9" y1="-3.32" x2="-1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-3.32" x2="1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="-7.5" y1="-1.97" x2="-6.8" y2="-3.04" width="0.4064" layer="21"/>
<wire x1="-6.8" y1="-3.04" x2="-6.1" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-6.1" y1="-1.97" x2="-7.5" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-10.21" y1="-4.1" x2="-10.21" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-10.21" y1="-4.1" x2="10.21" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="10.21" y1="-4.1" x2="10.21" y2="4.1" width="0.2032" layer="21"/>
<wire x1="10.21" y1="4.1" x2="-10.21" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-9.41" y1="-3.3" x2="-9.41" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-9.41" y1="3.3" x2="9.41" y2="3.3" width="0.2032" layer="21"/>
<wire x1="9.41" y1="3.3" x2="9.41" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="9.41" y1="-3.3" x2="1.9" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-3.3" x2="-9.41" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-10.21" y1="4.1" x2="-9.41" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-10.21" y1="-4.1" x2="-9.41" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="10.21" y1="4.1" x2="9.41" y2="3.3" width="0.2032" layer="21"/>
<wire x1="9.41" y1="-3.3" x2="10.21" y2="-4.1" width="0.2032" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1" shape="octagon"/>
<text x="-6.33" y="-6.88" size="1.778" layer="25">&gt;NAME</text>
<text x="-8.35" y="4.55" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-2.54" y="1.905" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="057-010-" prefix="X">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
10-pin series 057 contact pc board low profile headers</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="12.7" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="-10.16" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="12.7" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="-10.16" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="12.7" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="-10.16" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="12.7" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="-10.16" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="12.7" y="22.86" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="0" package="057-010-0">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="1" package="057-010-1">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="COM+" library="wirepad" deviceset="BANANA" device=""/>
<part name="PULS+" library="wirepad" deviceset="BANANA" device=""/>
<part name="SIGN+" library="wirepad" deviceset="BANANA" device=""/>
<part name="ALM" library="wirepad" deviceset="BANANA" device=""/>
<part name="VCMD" library="wirepad" deviceset="BANANA" device=""/>
<part name="SON" library="wirepad" deviceset="BANANA" device=""/>
<part name="PULS-" library="wirepad" deviceset="BANANA" device=""/>
<part name="SIGN-" library="wirepad" deviceset="BANANA" device=""/>
<part name="DG" library="wirepad" deviceset="BANANA" device=""/>
<part name="AG" library="wirepad" deviceset="BANANA" device=""/>
<part name="CON_DRIVER" library="con-panduit" deviceset="057-010-" device="1"/>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
<part name="H1" library="wirepad" deviceset="3,81/1,4" device=""/>
<part name="H2" library="wirepad" deviceset="3,81/1,4" device=""/>
<part name="H3" library="wirepad" deviceset="3,81/1,4" device=""/>
<part name="H4" library="wirepad" deviceset="3,81/1,4" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="COM+" gate="G$1" x="66.04" y="99.06"/>
<instance part="PULS+" gate="G$1" x="66.04" y="83.82"/>
<instance part="SIGN+" gate="G$1" x="66.04" y="68.58"/>
<instance part="ALM" gate="G$1" x="66.04" y="53.34"/>
<instance part="VCMD" gate="G$1" x="66.04" y="30.48"/>
<instance part="SON" gate="G$1" x="66.04" y="91.44"/>
<instance part="PULS-" gate="G$1" x="66.04" y="76.2"/>
<instance part="SIGN-" gate="G$1" x="66.04" y="60.96"/>
<instance part="DG" gate="G$1" x="66.04" y="45.72"/>
<instance part="AG" gate="G$1" x="66.04" y="38.1"/>
<instance part="CON_DRIVER" gate="-1" x="88.9" y="99.06"/>
<instance part="CON_DRIVER" gate="-2" x="88.9" y="91.44"/>
<instance part="CON_DRIVER" gate="-3" x="88.9" y="83.82"/>
<instance part="CON_DRIVER" gate="-4" x="88.9" y="76.2"/>
<instance part="CON_DRIVER" gate="-5" x="88.9" y="68.58"/>
<instance part="CON_DRIVER" gate="-6" x="88.9" y="60.96"/>
<instance part="CON_DRIVER" gate="-7" x="88.9" y="53.34"/>
<instance part="CON_DRIVER" gate="-8" x="88.9" y="45.72"/>
<instance part="CON_DRIVER" gate="-9" x="88.9" y="38.1"/>
<instance part="CON_DRIVER" gate="-10" x="88.9" y="30.48"/>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="H1" gate="1" x="27.94" y="111.76"/>
<instance part="H2" gate="1" x="116.84" y="114.3"/>
<instance part="H3" gate="1" x="25.4" y="20.32"/>
<instance part="H4" gate="1" x="121.92" y="22.86"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCMD" class="0">
<segment>
<pinref part="VCMD" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-10" pin="S"/>
<wire x1="66.04" y1="30.48" x2="83.82" y2="30.48" width="0.1524" layer="91"/>
<label x="76.2" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="AG" class="0">
<segment>
<pinref part="CON_DRIVER" gate="-9" pin="S"/>
<pinref part="AG" gate="G$1" pin="BANANA$1"/>
<wire x1="83.82" y1="38.1" x2="66.04" y2="38.1" width="0.1524" layer="91"/>
<label x="76.2" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="DG" class="0">
<segment>
<pinref part="DG" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-8" pin="S"/>
<wire x1="66.04" y1="45.72" x2="83.82" y2="45.72" width="0.1524" layer="91"/>
<label x="76.2" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="ALM" class="0">
<segment>
<pinref part="CON_DRIVER" gate="-7" pin="S"/>
<pinref part="ALM" gate="G$1" pin="BANANA$1"/>
<wire x1="83.82" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
<label x="76.2" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="SIGN-" class="0">
<segment>
<pinref part="SIGN-" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-6" pin="S"/>
<wire x1="66.04" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<label x="76.2" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="SIGN+" class="0">
<segment>
<pinref part="SIGN+" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-5" pin="S"/>
<wire x1="66.04" y1="68.58" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<label x="76.2" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="PULS-" class="0">
<segment>
<pinref part="PULS-" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-4" pin="S"/>
<wire x1="66.04" y1="76.2" x2="83.82" y2="76.2" width="0.1524" layer="91"/>
<label x="76.2" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="PULS+" class="0">
<segment>
<pinref part="PULS+" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-3" pin="S"/>
<wire x1="66.04" y1="83.82" x2="83.82" y2="83.82" width="0.1524" layer="91"/>
<label x="76.2" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="SON" class="0">
<segment>
<pinref part="SON" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-2" pin="S"/>
<wire x1="66.04" y1="91.44" x2="83.82" y2="91.44" width="0.1524" layer="91"/>
<label x="76.2" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="COM+" class="0">
<segment>
<pinref part="COM+" gate="G$1" pin="BANANA$1"/>
<pinref part="CON_DRIVER" gate="-1" pin="S"/>
<wire x1="66.04" y1="99.06" x2="83.82" y2="99.06" width="0.1524" layer="91"/>
<label x="76.2" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
