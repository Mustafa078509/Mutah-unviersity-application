import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  String x = 'jhk';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'About Us',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
      ),
      body: Card(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Card(
                elevation: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'Assests/Images-Icons/Mutah22.jpg',
                    fit: BoxFit.fill,
                    width: screenWidth,
                    height: screenHeight / 3.96,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 7, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Mutah University, ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'A royal decree was issued to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                  child: const Text(
                    'the university, the military wing in 1981, to be the third Jordanian university in the southern region after the University of Jordan in the central region and Yarmouk University in the northern region. In 1986, a decision was issued by the Higher Education Council to establish the civil wing of the university. The university was completed with its military and civil wings, so it distinguished itself from its sister universities in Jordan as the University of Al-Seef and Al-Qalam, where there are 6 colleges in the military wing: the College of Police Sciences, the College of Military Sciences, Princess Muna College of Nursing and Supportive Medical Professions, the Royal Jordanian National Defense College, and the Leadership College The Royal Staff and Prince Hassan College of Islamic Sciences.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text(
                'The area of ​​the university in its main site is (4000) dunums, and the university includes (15) colleges, including (7) scientific colleges, (7) humanities colleges, and the College of Graduate Studies, in addition to two deanships, the Deanship of Scientific Research, the Deanship of Student Affairs, and the Deanship of Academic Affairs/ward The university offers 105 academic programs, including (53) programs at the bachelor’s level, and programs at the high diploma level, (42) programs at the master’s level, and (9) programs at the doctoral level.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text(
                'The total number of university students for the academic year (2020/2021) was (19735), including (14,773) students in undergraduate programs, and (2826) students in postgraduate programs, at a rate of (16.06%) of the total university students, and the number of non-university students Jordanians at the university are (2136) students distributed over (28) Arab, Islamic and foreign countries, at a rate of approximately (8%) of the total university students.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text(
                'The number of faculty members at the university reached (626) faculty members, and the number of students on scholarships and candidates for scholarship until the end of (2020/2019) is 107, of whom (99) are on study seats, and (8) are candidates for delegation, and the number of employees is University employees (1786) administrative employees.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text(
                'Today, the university is taking confident steps towards continuous improvement to upgrade its inputs, operations and outputs, deriving its vision from the vision of His Majesty the King (may God protect him) addressed in the seventh discussion paper “Building our human capacity and developing the educational process is the essence of the nation’s renaissance” in which His Majesty indicated that “we want to see Our universities are factories of thinking minds, skilled labor, and productive energies.”',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: const Text(
                'The university seeks, according to its vision and mission, to be a competitive university, characterized by leadership in the fields of academic and military education, scientific research and sustainable development of society. By providing a university environment that enhances the system of leadership and innovation, supports education capabilities, and applied scientific research, and qualifies graduates who are able to compete in the labor market locally, regionally and globally, to achieve sustainable community development.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
              child: const Text(
                'This annual report comes to show the university’s achievements for the academic year (2020/2021) and it came in major themes that dealt with: global, accreditation and quality assurance, teaching, scientific research, projects, human and financial resources, management and administrative procedures, infrastructure, community service and activities.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                'All rights reserved, Mutah University ©',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
