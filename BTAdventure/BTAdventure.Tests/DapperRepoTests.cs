using BTAdventure.Data.DapperRepositories;
using BTAdventure.Models;
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

            Ending ending = dapperEndingRepository.FindById(2);

            Assert.AreEqual(2, ending.EndingId);
            Assert.AreEqual("Bad Ending here. Hi.", ending.EndingText);

        }
    }
}
