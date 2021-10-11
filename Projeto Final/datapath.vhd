LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY datapath IS
	PORT (
		btn3, btn2, btn1, CLK_500Hz, r1 : IN std_logic;
		state : IN std_logic_vector(1 DOWNTO 0);
		sw_entra : IN std_logic_vector(7 DOWNTO 0);
		h0, h1, h2 : OUT std_logic_vector(6 DOWNTO 0);
		led_out : OUT std_logic_vector (7 DOWNTO 0);
		end_game, end_round : OUT std_logic
	);
END datapath;

ARCHITECTURE arch OF datapath IS
	SIGNAL toup, score : std_logic_vector(7 DOWNTO 0);
	SIGNAL comp_score, acerto : std_logic;
	SIGNAL sai_h2s0, sai_h2s2, sai_h1s2, sai_h1s3, sai_hs1, sai_hs2, d7seg, sai_decodm0 : std_logic_vector(6 DOWNTO 0);
	SIGNAL trial : std_logic_vector(4 DOWNTO 0);
	SIGNAL entra_h00e0, entra_h00e1, entra_h02e1, sai_h0s0, sai_h0s2, sai_h0s3, sai_m0 : std_logic_vector(3 DOWNTO 0);
	SIGNAL seq, nivel : std_logic_vector(1 DOWNTO 0);
	SIGNAL pace, setup_sel : std_logic;
	SIGNAL STATE_01, STATE_10 : std_logic;
	SIGNAL CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz : std_logic;
	SIGNAL ckproc_sel, clk_sel : std_logic_vector(2 DOWNTO 0);
	SIGNAL demuxout0, demuxout1 : std_logic;
	SIGNAL tcn3, tc7 : std_logic;
	SIGNAL seq1out, seq2out, seq3out, seq4out : std_logic_vector(7 DOWNTO 0);
	SIGNAL sai_ledr : std_logic_vector(7 DOWNTO 0);
	SIGNAL countertrialenable, countertopeirareset, counterscoreenable, fsmclockreset : std_logic;

	COMPONENT demux IS
		PORT (
			ent, sel : IN std_logic;
			out0, out1 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mux2_1x4 IS
		PORT (
			sel : IN std_logic;
			ent0, ent1 : IN std_logic_vector(3 DOWNTO 0);
			saida : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux2_1x7 IS
		PORT (
			sel : IN std_logic;
			ent0, ent1 : IN std_logic_vector(6 DOWNTO 0);
			saida : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux2_1x8 IS
		PORT (
			sel : IN std_logic;
			ent0, ent1 : IN std_logic_vector(7 DOWNTO 0);
			saida : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux4_1x4 IS
		PORT (
			sel : IN std_logic_vector(1 DOWNTO 0);
			ent0, ent1, ent2, ent3 : IN std_logic_vector(3 DOWNTO 0);
			ss : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux4_1x7 IS
		PORT (
			sel : IN std_logic_vector(1 DOWNTO 0);
			ent0, ent1, ent2, ent3 : IN std_logic_vector(6 DOWNTO 0);
			ss : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decod7seg IS
		PORT (
			INPUT : IN std_logic_vector(3 DOWNTO 0);
			HEX : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT FSM_clock IS
		PORT (
			clk_500Hz : IN std_logic;
			reset : IN std_logic;
			CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mux8_1x1 IS
		PORT (
			sel : IN std_logic_vector(2 DOWNTO 0);
			ent0, ent1, ent2, ent3, ent4, ent5, ent6, ent7 : IN std_logic;
			saida : OUT std_logic
		);
	END COMPONENT;

	COMPONENT logica_trial IS
		PORT (
			N, T : IN std_logic_vector(1 DOWNTO 0);
			clk_sel : OUT std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT tflipflop IS
		PORT (
			T : IN std_logic;
			enable : IN std_logic;
			clock : IN std_logic;
			Q : OUT std_logic
		);
	END COMPONENT;

	COMPONENT contador IS
		PORT (
			enable : IN std_logic;
			clock : IN std_logic;
			contagem : OUT std_logic_vector(1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT comparator IS
		PORT (
			A, B : IN std_logic_vector(0 TO 7);
			output : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ComparatorSync IS
		PORT (
			entrada, CLK : IN std_logic;
			saida : OUT std_logic
		);
	END COMPONENT;

	COMPONENT contador_score IS
		PORT (
			data : IN std_logic_vector(1 DOWNTO 0);
			reset : IN std_logic;
			enable : IN std_logic;
			clock : IN std_logic;
			contagem : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT contador_topeira IS
		PORT (
			reset : IN std_logic;
			enable : IN std_logic;
			clock : IN std_logic;
			tc7 : OUT std_logic;
			contagem : OUT std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT contador_trial IS
		PORT (
			reset : IN std_logic;
			enable : IN std_logic;
			clock : IN std_logic;
			tcn3 : OUT std_logic;
			contagem : OUT std_logic_vector(1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT seq1 IS
		PORT (
			address : IN std_logic_vector(4 DOWNTO 0);
			data : OUT std_logic_vector(7 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT seq2 IS
		PORT (
			address : IN std_logic_vector(4 DOWNTO 0);
			data : OUT std_logic_vector(7 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT seq3 IS
		PORT (
			address : IN std_logic_vector(4 DOWNTO 0);
			data : OUT std_logic_vector(7 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT seq4 IS
		PORT (
			address : IN std_logic_vector(4 DOWNTO 0);
			data : OUT std_logic_vector(7 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT mux4_1x8 IS
		PORT (
			sel : IN std_logic_vector(1 DOWNTO 0);
			ent0, ent1, ent2, ent3 : IN std_logic_vector(7 DOWNTO 0);
			ss : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux2_1x3 IS
		PORT (
			sel : IN std_logic;
			ent0, ent1 : IN std_logic_vector(2 DOWNTO 0);
			saida : OUT std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;

BEGIN
	-- OUTPUTS
	end_round <= (tcn3 AND tc7) AND (NOT pace);
	end_game <= (NOT tcn3) AND tc7;

	-- STATES
	STATE_01 <= (NOT state(1)) AND state(0);
	STATE_10 <= state(1) AND (NOT state(0));

	-- COUNTER TRIAL
	countertrialenable <= (STATE_10 AND btn3);
	countertrial : contador_trial PORT MAP(r1, countertrialenable, CLK_500Hz, tcn3, trial(4 DOWNTO 3));
	seq1comp : seq1 PORT MAP(trial, seq1out);
	seq2comp : seq2 PORT MAP(trial, seq2out);
	seq3comp : seq3 PORT MAP(trial, seq3out);
	seq4comp : seq4 PORT MAP(trial, seq4out);
	seqmux : mux4_1x8 PORT MAP(seq, seq1out, seq2out, seq3out, seq4out, toup);

	-- LEDR
	toupmux : mux2_1x8 PORT MAP(STATE_01, "00000000", toup, sai_ledr);
	led_out <= sai_ledr;

	-- COUNTER TOPEIRA
	countertopeirareset <= (STATE_10 OR r1);
	countertopeira : contador_topeira PORT MAP(countertopeirareset, STATE_01, pace, tc7, trial(2 DOWNTO 0));

	-- COUNTER SCORE
	scorecomparator : comparator PORT MAP(toup, sw_entra(7 DOWNTO 0), comp_score);
	compsync : ComparatorSync PORT MAP(comp_score, CLK_500Hz, acerto);
	counterscoreenable <= (acerto AND STATE_01);
	counterscore : contador_score PORT MAP(trial(4 DOWNTO 3), r1, counterscoreenable, CLK_500Hz, score);

	-- COUNTER NIVEL & SEQ
	flipflop : tflipflop PORT MAP('1', btn1, CLK_500Hz, setup_sel);
	demuxsetup : demux PORT MAP(btn2, setup_sel, demuxout0, demuxout1);
	counternivel : contador PORT MAP(demuxout0, CLK_500Hz, nivel);
	counterseq : contador PORT MAP(demuxout1, CLK_500Hz, seq);

	-- FSM_CL0CK
	logictrial : logica_trial PORT MAP(nivel, trial(4 DOWNTO 3), clk_sel);
	muxclksel : mux2_1x3 PORT MAP(state(1), clk_sel, "001", ckproc_sel);
	fsmclockreset <= (r1 OR btn3);
	fscmclock : FSM_clock PORT MAP(CLK_500Hz, fsmclockreset, CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz);
	muxfsm : mux8_1x1 PORT MAP(ckproc_sel, CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz, CLK_2Hz, pace);

	-- HEX2
	m20 : mux2_1x7 PORT MAP(setup_sel, "1000111", "1110001", sai_h2s0); --L, J
	m22 : mux2_1x7 PORT MAP(pace, "0001100", "0000110", sai_h2s2); --P, E
	hs2 : mux4_1x7 PORT MAP(state, sai_h2s0, "0001100", sai_h2s2, sai_h2s2, sai_hs2); --P
	h2 <= sai_hs2;

	-- HEX1
	decodh1 : decod7seg PORT MAP(score(7 DOWNTO 4), d7seg);
	m12 : mux2_1x7 PORT MAP(pace, d7seg, "1000000", sai_h1s2); --apagado
	m13 : mux2_1x7 PORT MAP(pace, d7seg, "0101011", sai_h1s3); --n

	hs1 : mux4_1x7 PORT MAP(state, "1111111", d7seg, sai_h1s2, sai_h1s3, sai_hs1); --apagado
	h1 <= sai_hs1;

	-- HEX0
	entra_h00e0 <= "00" & nivel;
	entra_h00e1 <= "00" & seq;
	entra_h02e1 <= "00" & trial(4 DOWNTO 3);

	m00 : mux2_1x4 PORT MAP(setup_sel, entra_h00e0, entra_h00e1, sai_h0s0);
	m02 : mux2_1x4 PORT MAP(pace, score(3 DOWNTO 0), entra_h02e1, sai_h0s2);
	m03 : mux2_1x4 PORT MAP(pace, score(3 DOWNTO 0), "1101", sai_h0s3);

	m0 : mux4_1x4 PORT MAP(state, sai_h0s0, score(3 DOWNTO 0), sai_h0s2, sai_h0s3, sai_m0);
	decodm0 : decod7seg PORT MAP(sai_m0, sai_decodm0);
	h0 <= sai_decodm0;
END arch;
