using BTAdventure.Data.DapperRepositories;
using BTAdventure.Models;
using BTAdventure.Services;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTAdventure.Tests
{
    [TestFixture]
    class DapperRepoTests
    {
        [SetUp]
        public void Init()
        {
            using (var cn = new SqlConnection(ConfigurationManager.ConnectionStrings["BinaryTextAdventure"].ConnectionString))
            {
                var cmd = new SqlCommand();
                cmd.CommandText = "DbReset";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Connection = cn;
                cn.Open();

                cmd.ExecuteNonQuery();
            }
        }

        [Test]
        public void AllEndingsTest()
        {
            DapperEndingRepository dapperEndingRepository = new DapperEndingRepository();

            List<Ending> endings = dapperEndingRepository.All().ToList();

            Assert.AreEqual(6, endings.Count());

            Assert.AreEqual("The end is at hand.", endings[0].EndingText);

        }

        [Test]
        public void FindEndingByIdTest()
        {
            DapperEndingRepository dapperEndingRepository = new DapperEndingRepository();

            Ending ending = dapperEndingRepository.FindById(2);

            Assert.AreEqual(2, ending.EndingId);
            Assert.AreEqual("Bad Ending here. Hi.", ending.EndingText);

        }

        [Test]
        public void SaveEnding()
        {
            DapperEndingRepository dapperEndingRepository = new DapperEndingRepository();

            Ending ending = new Ending()
            {
                EndingText = "Test ending"
            };

            dapperEndingRepository.Save(ending);

            Ending insertedEnding = dapperEndingRepository.FindById(7);

            Assert.AreEqual(7, insertedEnding.EndingId);
            Assert.AreEqual("Test ending", insertedEnding.EndingText);

            insertedEnding.EndingText = "Ending Test Update";

            dapperEndingRepository.Save(insertedEnding);

            Ending updatedEnding = dapperEndingRepository.FindById(7);

            Assert.AreEqual(7, updatedEnding.EndingId);
            Assert.AreEqual("Ending Test Update", updatedEnding.EndingText);

        }

        [Test]
        public void DeleteEndingByIdTest()
        {
            DapperEndingRepository dapperEndingRepository = new DapperEndingRepository();

            Ending ending = new Ending()
            {
                EndingText = "Test ending"
            };

            dapperEndingRepository.Save(ending);

            List<Ending> endings = dapperEndingRepository.All().ToList();

            Ending insertedEnding = dapperEndingRepository.FindById(7);

            Assert.AreEqual(7, endings.Count);
            Assert.AreEqual(7, insertedEnding.EndingId);
            Assert.AreEqual("Test ending", insertedEnding.EndingText);

            dapperEndingRepository.Delete(7);

            endings = dapperEndingRepository.All().ToList();

            Assert.AreEqual(6, endings.Count);
        }

        [Test]
        public void AllEventChoiceTest()
        {
            DapperEventChoiceRepository dapperRepository = new DapperEventChoiceRepository();

            List<EventChoice> choices = dapperRepository.All().ToList();

            Assert.AreEqual(5, choices.Count());

            Assert.AreEqual(1, choices[0].EventChoiceId);
            Assert.AreEqual(1, choices[0].SceneId);
            Assert.AreEqual(0, choices[0].GenerationNumber);
            Assert.AreEqual("Greeting Event", choices[0].EventName);
            Assert.AreEqual("You are greeted in the foyer.", choices[0].StartText);
            Assert.AreEqual("You are gracious to your host", choices[0].PositiveText);
            Assert.AreEqual("You punch numerous holes in the foyer walls. A magical portal opens from one hole and you are teleported somewhere.", choices[0].NegativeText);
            Assert.AreEqual(2, choices[0].PositiveRoute);
            Assert.AreEqual(null, choices[0].NegativeRoute);
            Assert.AreEqual("Be gracious.", choices[0].PositiveButton);
            Assert.AreEqual("Punch holes in walls.", choices[0].NegativeButton);
            Assert.AreEqual(null, choices[0].PositiveSceneRoute);
            Assert.AreEqual(7, choices[0].NegativeSceneRoute);
            Assert.AreEqual(null, choices[0].PositiveEndingId);
            Assert.AreEqual(null, choices[0].NegativeEndingId);

        }

        [Test]
        public void FindEventChoiceByIdTest()
        {
            DapperEventChoiceRepository dapperRepository = new DapperEventChoiceRepository();

            EventChoice choice = dapperRepository.FindById(1);

            Assert.AreEqual(1, choice.EventChoiceId);
            Assert.AreEqual(1, choice.SceneId);
            Assert.AreEqual(0, choice.GenerationNumber);
            Assert.AreEqual("Greeting Event", choice.EventName);
            Assert.AreEqual("You are greeted in the foyer.", choice.StartText);
            Assert.AreEqual("You are gracious to your host", choice.PositiveText);
            Assert.AreEqual("You punch numerous holes in the foyer walls. A magical portal opens from one hole and you are teleported somewhere.", choice.NegativeText);
            Assert.AreEqual(2, choice.PositiveRoute);
            Assert.AreEqual(null, choice.NegativeRoute);
            Assert.AreEqual("Be gracious.", choice.PositiveButton);
            Assert.AreEqual("Punch holes in walls.", choice.NegativeButton);
            Assert.AreEqual(null, choice.PositiveSceneRoute);
            Assert.AreEqual(7, choice.NegativeSceneRoute);
            Assert.AreEqual(null, choice.PositiveEndingId);
            Assert.AreEqual(null, choice.NegativeEndingId);

        }

        [Test]
        public void SaveEventChoice()
        {
            DapperEventChoiceRepository dapperRepository = new DapperEventChoiceRepository();

            EventChoice newChoice = new EventChoice()
            {
                SceneId = 1,
                GenerationNumber = 2, 
                EventName = "TestEvent",
                StartText = "TestStart",
                PositiveText = "PositiveText",
                NegativeText = "NegativeText",
                PositiveRoute = null,
                NegativeRoute = null,
                PositiveButton = "PButton",
                NegativeButton = "NButton",
                PositiveSceneRoute = 7,
                NegativeSceneRoute = null,
                PositiveEndingId = null,
                NegativeEndingId = 3
            };

            dapperRepository.Save(newChoice);

            List<EventChoice> choices = dapperRepository.All().ToList();

            EventChoice choice = dapperRepository.FindById(6);

            Assert.AreEqual(6, choices.Count);

            Assert.AreEqual(6, choice.EventChoiceId);
            Assert.AreEqual(1, choice.SceneId);
            Assert.AreEqual(2, choice.GenerationNumber);
            Assert.AreEqual("TestEvent", choice.EventName);
            Assert.AreEqual("TestStart", choice.StartText);
            Assert.AreEqual("PositiveText", choice.PositiveText);
            Assert.AreEqual("NegativeText", choice.NegativeText);
            Assert.AreEqual(null, choice.PositiveRoute);
            Assert.AreEqual(null, choice.NegativeRoute);
            Assert.AreEqual("PButton", choice.PositiveButton);
            Assert.AreEqual("NButton", choice.NegativeButton);
            Assert.AreEqual(7, choice.PositiveSceneRoute);
            Assert.AreEqual(null, choice.NegativeSceneRoute);
            Assert.AreEqual(null, choice.PositiveEndingId);
            Assert.AreEqual(3, choice.NegativeEndingId);
        }

        [Test]
        public void DeleteEventChoiceByIdTest()
        {
            DapperEventChoiceRepository dapperRepository = new DapperEventChoiceRepository();

            EventChoice newChoice = new EventChoice()
            {
                SceneId = 1,
                GenerationNumber = 2,
                EventName = "TestEvent",
                StartText = "TestStart",
                PositiveText = "PositiveText",
                NegativeText = "NegativeText",
                PositiveRoute = null,
                NegativeRoute = null,
                PositiveButton = "PButton",
                NegativeButton = "NButton",
                PositiveSceneRoute = 7,
                NegativeSceneRoute = null,
                PositiveEndingId = null,
                NegativeEndingId = 3
            };

            dapperRepository.Save(newChoice);

            List<EventChoice> choices = dapperRepository.All().ToList();

            EventChoice choice = dapperRepository.FindById(6);

            Assert.AreEqual(6, choices.Count);

            dapperRepository.Delete(6);

            choices = dapperRepository.All().ToList();

            Assert.AreEqual(5, choices.Count);
        }

        [TestCase(6, 5, 4, 3, 1, 2, true, false, true)]
        [TestCase(6, 5, 4, 3, 1, 2, false, false, true)]
        [TestCase(6, 5, 4, 3, null, null, true, true, false)]
        [TestCase(6, 5, 4, 3, null, null, false, true, false)]
        [TestCase(6, 5, null, null, null, null, true, false, false)]
        [TestCase(6, 5, null, null, null, null, false, false, false)]
        [TestCase(null, null, null, null, null, null, true, false, false)]
        [TestCase(null, null, null, null, null, null, false, false, false)]
        public void CheckEventResult(int? pRoute, int? nRoute, int? pSRoute, int? nSRoute, int? pEnding, int? nEnding, bool positive, bool isScene, bool isEnding)
        {
            EventChoice choice = new EventChoice
            {
                EventChoiceId = 6,
                SceneId = 1,
                GenerationNumber = 0,
                EventName = "Test",
                StartText = "SText",
                PositiveText = "PText",
                NegativeText = "NText",
                PositiveButton = "PButton",
                NegativeButton = "NButton",
                PositiveRoute = pRoute,
                NegativeRoute = nRoute,
                PositiveSceneRoute = pSRoute,
                NegativeSceneRoute = nSRoute,
                PositiveEndingId = pEnding,
                NegativeEndingId = nEnding
            };

            DapperPlayerCharacterRepository dapperPlayerCharacterRepository = new DapperPlayerCharacterRepository();
            DapperGameRepository dapperGameRepository = new DapperGameRepository();
            DapperEventChoiceRepository dapperEventChoiceRepository = new DapperEventChoiceRepository();
            DapperOutcomeRepository dapperOutcomeRepository = new DapperOutcomeRepository();
            DapperPlayerRepository dapperPlayerRepository = new DapperPlayerRepository();
            DapperSceneRepository dapperSceneRepository = new DapperSceneRepository();

            GameService gService = new GameService(dapperPlayerCharacterRepository, dapperGameRepository, dapperEventChoiceRepository,
                dapperOutcomeRepository, dapperPlayerRepository, dapperSceneRepository);

            Tuple<ChoiceResult, int?> tuple = gService.DetermineNextRound(choice, positive);
            //EventChoice outputChoice = gService.DetermineNextRound(choice, positive);

            if (isEnding)
            {
                if (positive)
                {
                    Assert.AreEqual(ChoiceResult.Ending, tuple.Item1);
                    Assert.AreEqual(pEnding, tuple.Item2);
                }
                else
                {
                    Assert.AreEqual(ChoiceResult.Ending, tuple.Item1);
                    Assert.AreEqual(nEnding, tuple.Item2);
                }
            }
            else if(isScene)
            {
                if (positive)
                {
                    Assert.AreEqual(ChoiceResult.Scene, tuple.Item1);
                    Assert.AreEqual(pSRoute, tuple.Item2);
                }
                else
                {
                    Assert.AreEqual(ChoiceResult.Scene, tuple.Item1);
                    Assert.AreEqual(nSRoute, tuple.Item2);
                }
            }
            else if(tuple.Item2 == null || tuple.Item2 == -1)
            {
                Assert.AreEqual(ChoiceResult.Error, tuple.Item1);
            }
            else
            {
                if (positive)
                {
                    Assert.AreEqual(ChoiceResult.EventChoice, tuple.Item1);
                    Assert.AreEqual(pRoute, tuple.Item2);
                }
                else
                {
                    Assert.AreEqual(ChoiceResult.EventChoice, tuple.Item1);
                    Assert.AreEqual(nRoute, tuple.Item2);
                }
            }
        }

    }
}
