package ru.kpfu.itis.springsemesterwork.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.springsemesterwork.models.FileInfo;

public interface FileInfoRepository extends JpaRepository<FileInfo, Long> {
    FileInfo findOneByStorageFileName(String storageFileName);
}

