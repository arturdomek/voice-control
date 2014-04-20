#!/usr/X11R6/bin/perl
## Copyright (c) 2002  Takashi Sumiyoshi

# ------------------------------------------------------------
# Julian ������ʸˡ (.grammar, .voca) �� SAPI XML ʸˡ���Ѵ����ޤ���
# �����ʤ���ư�ǻȤ�����ɽ������ޤ���
# �¹Ԥˤ� Jcode �⥸�塼�뤬ɬ�פǤ���
# ���Ϥ� UTF-8 �������Ѵ�����Τ˳������ޥ�ɤȤ��� iconv ����Ѥ��Ƥ��ޤ���
# ------------------------------------------------------------
# ����: Julian ������ʸˡ�Ǥϡ����Ƶ����Ȥ��ޤ��󡣵դ� SAPI XML ������
# �Ϻ��Ƶ����Ȥ��ޤ��󡣤��Υġ���Ϥ����Ѵ��ޤǤϤ��ʤ��Τǡ����Ƶ���
# �ޤ�ʸˡ�ϡ��Ѵ���˼��Ȥǽ�������ɬ�פ�����ޤ���
# ------------------------------------------------------------
# ���Ϥ���� SAPI XML ʸˡ�ե�����ϡ����ե������ʸˡ����ü���桢��ü����
# ��롼����Ѵ�����Ȥ���ñ����Ѵ��Ǥ��뤿�ᡢ��ꥨ�쥬��Ȥˤ���ˤ�
# ���Ȥǽ�������ɬ�פ�����ޤ���
# ------------------------------------------------------------

use strict;
use Jcode;
my $iconv = "iconv -f eucJP -t UTF-8"; # iconv command line

############################################################
# convertphone �ǻ��Ѥ���
############################################################
sub vowel
{
    if ($_[0] eq "a") { return $_[1];}
    if ($_[0] eq "i") { return $_[2];}
    if ($_[0] eq "u") { return $_[3];}
    if ($_[0] eq "e") { return $_[4];}
    if ($_[0] eq "o") { return $_[5];}
    if ($_[0] eq "a:") { return $_[1]."��";}
    if ($_[0] eq "i:") { return $_[2]."��";}
    if ($_[0] eq "u:") { return $_[3]."��";}
    if ($_[0] eq "e:") { return $_[4]."��";}
    if ($_[0] eq "o:") { return $_[5]."��";}
    return 0;
}

############################################################
# ���֥롼�ƥ���: ���ϲ������󤫤饫��ʸ��������������Ϥ��������Ȳ���
############################################################
sub convertphone
{
    my $rval = "";
    my $c;
    my $d;
    my $r;
    while($c = shift @_)
    {
	if ($c eq "k") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "ky") { $d = shift @_;
            if ($r = vowel($d,"����","kyi?","����","kye?","����")) { $rval .= $r; }
	}
	if ($c eq "s") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "sy") { $d = shift @_;
            if ($r = vowel($d,"����","syi?","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "sh") { $d = shift @_;
	    if ($r = vowel($d,"����","��","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "t") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "ts") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "ty") { $d = shift @_;
	    if ($r = vowel($d,"����","tyi?","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "ch") { $d = shift @_;
	    if ($r = vowel($d,"����","��","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "n") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "ny") { $d = shift @_;
	    if ($r = vowel($d,"�ˤ�","nyi?","�ˤ�","�ˤ�","�ˤ�")) { $rval .= $r; }
	}
	if ($c eq "h") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "hy") { $d = shift @_;
	    if ($r = vowel($d,"�Ҥ�","hyi?","�Ҥ�","�Ҥ�","�Ҥ�")) { $rval .= $r; }
	}
	if ($c eq "f") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "m") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "my") { $d = shift @_;
	    if ($r = vowel($d,"�ߤ�","myi?","�ߤ�","�ߤ�","�ߤ�")) { $rval .= $r; }
	}
	if ($c eq "y") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "r") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "ry") { $d = shift @_;
	    if ($r = vowel($d,"���","ryi?","���","�ꤧ","���")) { $rval .= $r; }
	}
	if ($c eq "w") { $d = shift @_;
	    if ($r = vowel($d,"��","����","wu?","����","��")) { $rval .= $r; }
	}
	if ($c eq "g") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "gy") { $d = shift @_;
	    if ($r = vowel($d,"����","gyi?","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "z") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "zy") { $d = shift @_;
	    if ($r = vowel($d,"����","zyi?","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "j") { $d = shift @_;
	    if ($r = vowel($d,"����","��","����","����","����")) { $rval .= $r; }
	}
	if ($c eq "d") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "dy") { $d = shift @_;
	    if ($r = vowel($d,"�¤�","dyi?","�¤�","�¤�","�¤�")) { $rval .= $r; }
	}
	if ($c eq "b") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "by") { $d = shift @_;
	    if ($r = vowel($d,"�Ӥ�","byi?","�Ӥ�","�Ӥ�","�Ӥ�")) { $rval .= $r; }
	}
	if ($c eq "p") { $d = shift @_;
	    if ($r = vowel($d,"��","��","��","��","��")) { $rval .= $r; }
	}
	if ($c eq "py") { $d = shift @_;
	    if ($r = vowel($d,"�Ԥ�","pyi?","�Ԥ�","�Ԥ�","�Ԥ�")) { $rval .= $r; }
	}
	if ($c eq "N") { $rval .= "��" }
	if ($c eq "q") { $rval .= "��" }
	if ($c eq "sp") { $rval .= '@sp' }
	if ($c eq "silB") { $rval .= '@silB' }
	if ($c eq "silE") { $rval .= '@silE' }

	if ($r = vowel($c,"��","��","��","��","��")) { $rval .= $r; }
    }
    return $rval;
}

############################################################
# �ᥤ��ؿ�
############################################################
if (@ARGV == 0)
{
    print STDERR << "EOF";
gram2sapixml.pl   by Takashi Sumiyoshi 2002
usage: gram2sapixml.pl [basename] ...

   input files: <basename>.grammar (Julian grammar file)
                <basename>.voca    (Julian voca file)
   output file: <basename>.xml     (SAPI Grammar XML file in UTF-8 Format)

This script uses the iconv command to convert the encoding.
EOF
    exit;
}

my $removesps = 1;   # sp, silB, silE �����

while(@ARGV)
{
    my $filebase = shift @ARGV;
    my $grammarfile = $filebase . ".grammar";
    my $vocafile = $filebase . ".voca";
    my $sapixmlfile = $filebase . ".xml";

    print STDERR "Processing $vocafile, $grammarfile...\n";

    my $vocaword = "";
    my %lexicon_disp;
    my %lexicon_yomi;
    my %grammar_left;
    my @input;
    my $disp;
    my $yomi;
    my $hiragana;

    ###
    ### load voca file
    ###
    open (VOCA, $vocafile) or die "Cannot open $vocafile";

    while(<VOCA>) {
	chomp;
	next if /^#/;
	@input = split (/[ \t]+/, $_);
	if (/^\%/) {
	    s/#.*$//;
	    $vocaword = substr($_, 1); # ��Ƭ�� % ��ȴ��
	    $vocaword =~ s/^[ \t]+//g;
	    $vocaword =~ s/[ \t]+$//g;
	} else {
	    $disp = shift @input;
	    $disp = Jcode->new($disp)->euc;
	    if ($disp ne "")
	    {
		if ($removesps == 1 && ($disp eq "sp" || $disp eq "silB" || $disp eq "silE")) {
		} else {
		    # ����ɽ���򤫤�ʸ������Ѵ�
		    $hiragana = convertphone(@input);
#		print "voca [$vocaword] in $disp,$hiragana\n";
		    
		    # lexicon_disp, lexicon_yomi �˳�Ǽ
		    push @{$lexicon_disp{$vocaword}}, $disp;
		    push @{$lexicon_yomi{$vocaword}}, $hiragana;
		}
	    }
	}
    }
    close (VOCA);

    ###
    ### load grammar file
    ###
    open (GRAMMAR, $grammarfile) or die "Cannot open $grammarfile";

    my $left;
    while(<GRAMMAR>)
    {
	chomp;
	next if /^#/;
	s/#.*$//;
	next if $_ eq "";
	@input = split (/[ \t:]+/, $_);
	$left = shift @input;

	# grammar_left ������ؤΥ�ե���󥹤���������Ǥˤ��Ϣ������
	# MEMO: [@input] �� \@input �Ȥ�����ȼ��Τ����٤�Ʊ���ˤʤ�ޤ���
	push @{$grammar_left{$left}}, [@input];
    }

    close (GRAMMAR);

    ###
    ### save sapixml file
    ###

    ###
    ### convert by iconv
    ###
    open (SAPIXML, "| $iconv > $sapixmlfile") or die "Cannot open $sapixmlfile or cannot exec iconv";

    print SAPIXML "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
    print SAPIXML "<GRAMMAR>\n";

    # �ޤ��� grammar �ե�����Υ롼��
    # RULEREF ���¤٤�
    my $i;
    my $n;
    my $a;
    my @b;
    foreach $i (keys %grammar_left)
    {
	if ($i eq "S")
	{
	    print SAPIXML "<RULE name=\"$i\" toplevel=\"ACTIVE\">\n";
	} else {
	    print SAPIXML "<RULE name=\"$i\" toplevel=\"INACTIVE\">\n";
	}
	print SAPIXML "  <L>\n";
	while ($a = shift @{$grammar_left{$i}})
	{
	    print SAPIXML "    <P>\n";
	    @b = @{$a};
	    while ($n = shift @b)
	    {
		if ($removesps == 1 && ! exists $lexicon_disp{$n} && ! exists $grammar_left{$n})
		{
#		    print SAPIXML "#     <RULEREF name=\"$n\"/>\n";
		} else {
		    print SAPIXML "      <RULEREF name=\"$n\"/>\n";
		}
	    }
	    print SAPIXML "    </P>\n";
	}
	
	print SAPIXML "  </L>\n";
	print SAPIXML "</RULE>\n";
    }

    # ������ voca �ե�����Υ��ƥ���̾��ñ��
    foreach $i (keys %lexicon_disp)
    {
	print SAPIXML "<RULE name=\"$i\" toplevel=\"INACTIVE\">\n";
	print SAPIXML "  <L>\n";
	while ($disp = shift @{$lexicon_disp{$i}})
	{
	    $yomi = shift @{$lexicon_yomi{$i}};
	    if ($disp eq $yomi)
	    {
		print SAPIXML "    <P>$yomi</P>\n";
	    } else {
		print SAPIXML "    <P>/$disp/$yomi;</P>\n";
	    }
	}
	print SAPIXML "  </L>\n";
	print SAPIXML "</RULE>\n";
    }
    print SAPIXML "</GRAMMAR>\n";
}