--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    id integer NOT NULL,
    amenity text NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- Name: available_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.available_dates (
    id integer NOT NULL,
    available_date date NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.available_dates OWNER TO postgres;

--
-- Name: booking_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_property (
    id integer NOT NULL,
    property_id integer NOT NULL,
    guest_id integer NOT NULL
);


ALTER TABLE public.booking_property OWNER TO postgres;

--
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    country text NOT NULL
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: employee_email_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_email_addresses (
    id integer NOT NULL,
    email_address text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.employee_email_addresses OWNER TO postgres;

--
-- Name: employee_phone_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_phone_numbers (
    id integer NOT NULL,
    phone_number text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.employee_phone_numbers OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    house_number integer NOT NULL,
    street text NOT NULL,
    city text NOT NULL,
    province text NOT NULL,
    first_name text NOT NULL,
    middle_name text,
    last_name text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    job text NOT NULL,
    salary money NOT NULL,
    branch_id integer NOT NULL,
    manager_id integer,
    property_id integer NOT NULL
)
INHERITS (public.users);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: guest_email_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guest_email_addresses (
    id integer NOT NULL,
    email_address text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guest_email_addresses OWNER TO postgres;

--
-- Name: guest_phone_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guest_phone_numbers (
    id integer NOT NULL,
    phone_number text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guest_phone_numbers OWNER TO postgres;

--
-- Name: guests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guests (
)
INHERITS (public.users);


ALTER TABLE public.guests OWNER TO postgres;

--
-- Name: host_email_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.host_email_addresses (
    id integer NOT NULL,
    email_address text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.host_email_addresses OWNER TO postgres;

--
-- Name: host_phone_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.host_phone_numbers (
    id integer NOT NULL,
    phone_number text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.host_phone_numbers OWNER TO postgres;

--
-- Name: hosts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hosts (
)
INHERITS (public.users);


ALTER TABLE public.hosts OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    type_of_payment text NOT NULL,
    amount money NOT NULL,
    status text NOT NULL,
    guest_id integer NOT NULL,
    host_id integer NOT NULL,
    CONSTRAINT payment_check CHECK (((((type_of_payment = 'cash'::text) OR (type_of_payment = 'cheque'::text)) AND (status = 'completed'::text)) OR (((type_of_payment = 'credit card'::text) OR (type_of_payment = 'direct debit'::text)) AND (status = 'approved'::text)) OR (status = 'pending'::text))),
    CONSTRAINT payment_type_of_payment_check CHECK (((type_of_payment = 'cash'::text) OR (type_of_payment = 'cheque'::text) OR (type_of_payment = 'credit card'::text) OR (type_of_payment = 'direct debit'::text)))
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property (
    id integer NOT NULL,
    house_number integer NOT NULL,
    street text NOT NULL,
    city text NOT NULL,
    province text NOT NULL,
    property_type text NOT NULL,
    room_type text NOT NULL,
    accommodates integer NOT NULL,
    bathrooms integer NOT NULL,
    bedrooms integer NOT NULL,
    beds integer NOT NULL,
    branch_id integer NOT NULL,
    host_id integer NOT NULL,
    renter_rate_id integer NOT NULL
);


ALTER TABLE public.property OWNER TO postgres;

--
-- Name: rental_agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_agreement (
    id integer NOT NULL,
    signing_date date NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.rental_agreement OWNER TO postgres;

--
-- Name: renter_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.renter_rate (
    id integer NOT NULL,
    price money NOT NULL,
    number_of_guests integer NOT NULL
);


ALTER TABLE public.renter_rate OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    rating integer NOT NULL,
    communication integer NOT NULL,
    cleanliness integer NOT NULL,
    value integer NOT NULL,
    guest_id integer NOT NULL,
    property_id integer NOT NULL,
    CONSTRAINT review_cleanliness_check CHECK (((cleanliness > 0) AND (6 > cleanliness))),
    CONSTRAINT review_communication_check CHECK (((communication > 0) AND (6 > communication))),
    CONSTRAINT review_rating_check CHECK (((rating > 0) AND (6 > rating))),
    CONSTRAINT review_value_check CHECK (((value > 0) AND (6 > value)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules (
    id integer NOT NULL,
    rule text NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.rules OWNER TO postgres;

--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (id, amenity, property_id) FROM stdin;
1	Outdoor pool.	1
2	Complimentary gym access.	2
3	Games room included.	3
4	In-building restaurants.	4
5	Indoor pool included.	5
\.


--
-- Data for Name: available_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.available_dates (id, available_date, property_id) FROM stdin;
1	2020-05-10	1
2	2020-07-03	2
3	2020-06-01	3
4	2019-10-20	4
5	2020-02-07	5
\.


--
-- Data for Name: booking_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_property (id, property_id, guest_id) FROM stdin;
1	4	33
2	2	32
3	1	35
4	5	33
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, country) FROM stdin;
1	Canada
2	Canada
3	Canada
4	Canada
\.


--
-- Data for Name: employee_email_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_email_addresses (id, email_address, user_id) FROM stdin;
1	jeb@gmail.com	11
2	yon@gmail.com	12
3	eric@gmail.com	13
4	alex@gmail.com	14
5	jess@gmail.com	15
6	mark@gmail.com	16
7	jonny@gmail.com	17
8	Darren@gmail.com	18
9	gary@gmail.com	19
\.


--
-- Data for Name: employee_phone_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_phone_numbers (id, phone_number, user_id) FROM stdin;
1	433-545-8766	11
2	222-221-2324	12
3	465-435-1212	13
4	132-346-7578	14
5	123-456-7956	15
6	354-231-8687	16
7	878-435-1341	17
8	423-645-1213	18
9	565-344-1157	19
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, house_number, street, city, province, first_name, middle_name, last_name, job, salary, branch_id, manager_id, property_id) FROM stdin;
11	454	Wolkwa Drive	Vancouver	British Columbia	Jeb	\N	Beb	Branch Manager	$30,500.00	1	\N	1
12	1212	Askeree Way	Vancouver	British Columbia	Yonny	\N	Yonson	Employee	$13,500.00	1	11	1
13	23	Asadwa Circle	Montreal	Quebec	Eric	\N	Garner	Branch Manager	$50,500.00	2	\N	2
14	878	Qwerty Lane	Montreal	Quebec	Alex	\N	Dawson	Employee	$23,000.00	2	13	2
15	435	Adsulry Crescent	Saskatoon	Saskatchewan	Jessica	\N	Ball	Branch Manager	$28,000.00	3	\N	3
16	233	Bilthy Drive	Saskatoon	Saskatchewan	Mark	\N	Mathews	Employee	$14,500.00	3	15	3
17	12	Arredack Street	Ottawa	Ontario	Jonathan	\N	Banks	Branch Manager	$30,000.00	4	\N	4
18	323	Wekward Way	Ottawa	Ontario	Darren	\N	Bills	Employee	$12,000.00	4	17	4
19	767	Adefe Drive	Toronto	Ontario	Gary	\N	Willis	Employee	$25,000.00	4	17	5
\.


--
-- Data for Name: guest_email_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest_email_addresses (id, email_address, user_id) FROM stdin;
1	beth@gmail.com	31
2	eded@gmail.com	32
3	vteller@gmail.com	33
4	james@gmail.com	34
5	will@gmail.com	35
\.


--
-- Data for Name: guest_phone_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest_phone_numbers (id, phone_number, user_id) FROM stdin;
1	654-355-7677	31
2	223-435-7777	32
3	345-767-3413	33
4	778-434-4224	34
5	867-277-8786	35
\.


--
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guests (id, house_number, street, city, province, first_name, middle_name, last_name) FROM stdin;
31	74	Waaask Drive	Ottawa	Ontario	Bethany	\N	Sosa
32	52	Aekeo Way	Toronto	Ontario	Edward	\N	Edwards
33	887	Slabe Street	Montreal	Quebec	Vick	\N	Teller
34	6765	Worthington Cresent	Vancouver	British Columbia	James	\N	May
35	86	Boel Street	Saskatoon	Saskatchewan	Wilbur	\N	Reeves
\.


--
-- Data for Name: host_email_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.host_email_addresses (id, email_address, user_id) FROM stdin;
1	jeff@gmail.com	21
2	bill@gmail.com	22
3	kkyl01@gmail.com	23
4	ainw@gmail.com	24
5	bwall@gmail.com	25
\.


--
-- Data for Name: host_phone_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.host_phone_numbers (id, phone_number, user_id) FROM stdin;
1	420-223-5345	21
2	544-477-8867	22
3	667-454-2434	23
4	876-212-6689	24
5	434-566-7578	25
\.


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hosts (id, house_number, street, city, province, first_name, middle_name, last_name) FROM stdin;
21	13	Bridle Park Drive	Ottawa	Ontario	Jeff	\N	Jefferson
22	144	Equestrian Drive	Toronto	Ontario	Bill	\N	Billson
23	75	Stonehaven Drive	Montreal	Quebec	Kyle	\N	Kyleson
24	87	Alsasla Street	Vancouver	British Columbia	Alice	\N	Inwonder
25	677	Caskata Way	Saskatoon	Saskatchewan	Barret	\N	Wallace
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, type_of_payment, amount, status, guest_id, host_id) FROM stdin;
2	cheque	$555.00	pending	32	23
1	cash	$122.00	completed	33	21
4	direct debit	$1,244.00	approved	33	22
3	credit card	$360.00	approved	35	24
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property (id, house_number, street, city, province, property_type, room_type, accommodates, bathrooms, bedrooms, beds, branch_id, host_id, renter_rate_id) FROM stdin;
1	30	Roadstreet Drive	Vancouver	British Columbia	Bed & Breakfast	Private Room	3	2	1	2	1	24	1
2	456	Aweksm Drive	Montreal	Quebec	Apartment	Shared Room	2	2	2	2	2	23	2
3	687	Welcks Drive	Saskatoon	Saskatchewan	Unique Home	Unique Space	1	1	1	1	4	25	3
4	123	Fourfive Drive	Ottawa	Ontario	Apartment	Private Room	1	1	1	1	3	21	4
5	7634	Wayroad Lane	Toronto	Ontario	Vacation Home	Private Room	5	4	3	4	3	22	5
\.


--
-- Data for Name: rental_agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_agreement (id, signing_date, start_date, end_date, property_id) FROM stdin;
1	2019-09-10	2019-10-20	2019-10-22	4
2	2020-01-03	2020-07-03	2020-07-10	2
3	2020-01-05	2020-05-10	2020-05-17	1
4	2020-02-05	2020-02-07	2020-02-14	5
\.


--
-- Data for Name: renter_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.renter_rate (id, price, number_of_guests) FROM stdin;
1	$360.00	1
2	$555.00	3
3	$676.00	2
4	$122.00	1
5	$1,224.00	5
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, rating, communication, cleanliness, value, guest_id, property_id) FROM stdin;
1	5	4	5	5	33	4
2	4	3	4	5	33	5
3	3	2	4	4	32	2
\.


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rules (id, rule, property_id) FROM stdin;
1	No pets.	1
2	No smoking or vaping.	3
3	No pets.	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, house_number, street, city, province, first_name, middle_name, last_name) FROM stdin;
\.


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- Name: available_dates available_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.available_dates
    ADD CONSTRAINT available_dates_pkey PRIMARY KEY (id);


--
-- Name: booking_property booking_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_property
    ADD CONSTRAINT booking_property_pkey PRIMARY KEY (id);


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- Name: employee_email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: employees employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: guest_email_addresses guest_email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_email_addresses
    ADD CONSTRAINT guest_email_addresses_pkey PRIMARY KEY (id);


--
-- Name: guest_phone_numbers guest_phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_phone_numbers
    ADD CONSTRAINT guest_phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: guests guest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guest_pkey PRIMARY KEY (id);


--
-- Name: host_email_addresses host_email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host_email_addresses
    ADD CONSTRAINT host_email_addresses_pkey PRIMARY KEY (id);


--
-- Name: host_phone_numbers host_phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host_phone_numbers
    ADD CONSTRAINT host_phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: hosts host_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT host_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: employee_phone_numbers phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: property property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (id);


--
-- Name: rental_agreement rental_agreement_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.rental_agreement
    ADD CONSTRAINT rental_agreement_check CHECK (((end_date > start_date) AND (start_date > signing_date))) NOT VALID;


--
-- Name: rental_agreement rental_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_agreement
    ADD CONSTRAINT rental_agreement_pkey PRIMARY KEY (id);


--
-- Name: renter_rate renter_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renter_rate
    ADD CONSTRAINT renter_rate_pkey PRIMARY KEY (id);


--
-- Name: reviews review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: amenities amenities_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id) NOT VALID;


--
-- Name: available_dates available_dates_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.available_dates
    ADD CONSTRAINT available_dates_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id) NOT VALID;


--
-- Name: booking_property booking_property_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_property
    ADD CONSTRAINT booking_property_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(id) NOT VALID;


--
-- Name: booking_property booking_property_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_property
    ADD CONSTRAINT booking_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id) NOT VALID;


--
-- Name: employees employee_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) NOT VALID;


--
-- Name: employee_email_addresses employee_email_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_email_addresses
    ADD CONSTRAINT employee_email_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.employees(id) NOT VALID;


--
-- Name: employees employee_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(id) NOT VALID;


--
-- Name: employee_phone_numbers employee_phone_numbers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_phone_numbers
    ADD CONSTRAINT employee_phone_numbers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.employees(id) NOT VALID;


--
-- Name: employees employee_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id) NOT VALID;


--
-- Name: guest_email_addresses guest_email_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_email_addresses
    ADD CONSTRAINT guest_email_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.guests(id);


--
-- Name: guest_phone_numbers guest_phone_numbers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest_phone_numbers
    ADD CONSTRAINT guest_phone_numbers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.guests(id);


--
-- Name: host_email_addresses host_email_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host_email_addresses
    ADD CONSTRAINT host_email_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.hosts(id);


--
-- Name: host_phone_numbers host_phone_numbers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host_phone_numbers
    ADD CONSTRAINT host_phone_numbers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.hosts(id);


--
-- Name: payment payment_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(id) NOT VALID;


--
-- Name: payment payment_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id) NOT VALID;


--
-- Name: property property_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) NOT VALID;


--
-- Name: property property_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id) NOT VALID;


--
-- Name: property property_renter_rate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_renter_rate_id_fkey FOREIGN KEY (renter_rate_id) REFERENCES public.renter_rate(id) NOT VALID;


--
-- Name: rental_agreement rental_agreement_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_agreement
    ADD CONSTRAINT rental_agreement_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id) NOT VALID;


--
-- Name: reviews review_guest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT review_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guests(id) NOT VALID;


--
-- Name: reviews review_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT review_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id);


--
-- Name: rules rules_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(id);


--
-- PostgreSQL database dump complete
--

